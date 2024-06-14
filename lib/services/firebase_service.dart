// firestore_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class FirebaseService {
  Future<void> setDocument({required String collection, required String docId, required Map<String, dynamic> userData});
  Future<void> createDocument({required String collection, required Map<String, dynamic> userData});
  Future<DocumentSnapshot> getDocument({required String collection, required String docId});
  Future<void> updateDocument({required String collection, required String docId, required Map<String, dynamic> userData});
  Future<void> deleteDocument({required String collection, required String docId});
  Stream<QuerySnapshot> getCollectionStream({required String collection, String? filterField, Object? ref});
  Stream<DocumentSnapshot> getDocumentStream({required String collection, required String docId});
  String getUserId();
}

@Singleton(as: FirebaseService)
class FirebaseServiceImpl implements FirebaseService {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  FirebaseServiceImpl(this.firestore, this.auth);

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
    return auth.currentUser!.uid;
  }
}
