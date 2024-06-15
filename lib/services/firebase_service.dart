import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/services/cache_service.dart';
import 'package:uuid/uuid.dart';

abstract class FirebaseService {
  Future<void> setDocument({required String collection, required String docId, required Map<String, dynamic> userData});
  Future<void> createDocument({required String collection, required Map<String, dynamic> userData});
  Future<DocumentSnapshot> getDocument({required String collection, required String docId});
  Future<void> updateDocument({required String collection, required String docId, required Map<String, dynamic> userData});
  Future<void> deleteDocument({required String collection, required String docId});
  Stream<QuerySnapshot> getCollectionStream({required String collection, String? filterField, Object? ref});
  Stream<DocumentSnapshot> getDocumentStream({required String collection, required String docId});
  Future<void> deleteUserCartItems(String userId);
  String getUserId();
  bool isRegistered();
  Future<void> register({bool isGuest = false});
  void logout();
}

@Singleton(as: FirebaseService)
class FirebaseServiceImpl implements FirebaseService {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final CacheService cache;

  FirebaseServiceImpl(this.firestore, this.auth, this.cache);

  @override
  Future<void> setDocument({required String collection, required String docId, required Map<String, dynamic> userData}) async {
    await firestore.collection(collection).doc(docId).set(userData);
  }

  @override
  Future<void> createDocument({required String collection, required Map<String, dynamic> userData}) async {
    await firestore.collection(collection).add(userData);
  }

  @override
  Future<DocumentSnapshot> getDocument({required String collection, required String docId}) async {
    return await firestore.collection(collection).doc(docId).get();
  }

  @override
  Future<void> updateDocument({required String collection, required String docId, required Map<String, dynamic> userData}) async {
    await firestore.collection(collection).doc(docId).update(userData);
  }

  @override
  Future<void> deleteDocument({required String collection, required String docId}) async {
    await firestore.collection(collection).doc(docId).delete();
  }

  @override
  Stream<QuerySnapshot> getCollectionStream({required String collection, String? filterField, Object? ref}) {
    return ref != null && filterField != null
        ? firestore.collection(collection).where(filterField, isEqualTo: ref).snapshots()
        : firestore.collection(collection).snapshots();
  }

  @override
  Stream<DocumentSnapshot> getDocumentStream({required String collection, required String docId}) {
    return firestore.collection(collection).doc(docId).snapshots();
  }

  @override
  String getUserId() {
    if (auth.currentUser != null) {
      return auth.currentUser!.uid;
    }
    return cache.retrieve(key: CacheService.guestKey);
  }

  @override
  bool isRegistered() {
    bool isGuest = cache.retrieve(key: CacheService.guestKey) != null;
    bool isGoogleUser = auth.currentUser != null;

    return isGuest || isGoogleUser;
  }

  @override
  Future<void> register({bool isGuest = false}) async {
    if (isGuest) {
      String randomId = const Uuid().v1();
      cache.store(key: CacheService.guestKey, value: randomId);
      final DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(randomId);

      final DocumentSnapshot userDocSnapshot = await userDocRef.get();
      if (!userDocSnapshot.exists) {
        await userDocRef.set({
          'wishlist': [],
        });
      }
    } else {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await auth.signInWithCredential(credential);

      final DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid);

      final DocumentSnapshot userDocSnapshot = await userDocRef.get();
      if (!userDocSnapshot.exists) {
        await userDocRef.set({
          'name': auth.currentUser!.displayName,
          'email': auth.currentUser!.email,
          'image': auth.currentUser!.photoURL,
          'wishlist': [],
        });
      }
    }
  }

  @override
  void logout() {
    try {
      cache.cleanStorage();
      auth.signOut();
    } catch (e) {
      e;
    }
  }

  @override
  Future<void> deleteUserCartItems(String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference cartCollection = firestore.collection('cart');

    QuerySnapshot querySnapshot = await cartCollection.where('userId', isEqualTo: userId).get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }
}
