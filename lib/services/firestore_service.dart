// firestore_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreService {
  Future<void> createUser(String userId, Map<String, dynamic> userData);
  Future<DocumentSnapshot> getUser(String userId);
  Future<void> updateUser(String userId, Map<String, dynamic> userData);
  Future<void> deleteUser(String userId);
  Stream<QuerySnapshot> getUsersStream();
}

@Singleton(as: FirestoreService)
class FirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore firestore;

  FirestoreServiceImpl(this.firestore);

  @override
  Future<void> createUser(String userId, Map<String, dynamic> userData) async {
    await firestore.collection('users').doc(userId).set(userData);
  }

  @override
  Future<DocumentSnapshot> getUser(String userId) async {
    return await firestore.collection('users').doc(userId).get();
  }

  @override
  Future<void> updateUser(String userId, Map<String, dynamic> userData) async {
    await firestore.collection('users').doc(userId).update(userData);
  }

  @override
  Future<void> deleteUser(String userId) async {
    await firestore.collection('users').doc(userId).delete();
  }

  @override
  Stream<QuerySnapshot> getUsersStream() {
    return firestore.collection('users').snapshots();
  }
}
