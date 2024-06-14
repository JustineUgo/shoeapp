// firestore_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreService {
  Future<void> createDocument({required String collection, required String docId, required Map<String, dynamic> userData});
  Future<DocumentSnapshot> getDocument({required String collection, required String docId});
  Future<void> updateDocument({required String collection, required String docId, required Map<String, dynamic> userData});
  Future<void> deleteDocument({required String collection, required String docId});
  Stream<QuerySnapshot> getCollectionStream({required String collection, String? filterField, DocumentReference? ref});
}

@Singleton(as: FirestoreService)
class FirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore firestore;

  FirestoreServiceImpl(this.firestore);

  @override
  Future<void> createDocument({required String collection, required String docId, required Map<String, dynamic> userData}) async {
    await firestore.collection(collection).doc(docId).set(userData);
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
  Stream<QuerySnapshot> getCollectionStream({required String collection, String? filterField, DocumentReference? ref}) {
    return ref!=null && filterField!=null? 
    firestore.collection(collection).where(filterField, isEqualTo: ref).snapshots():
    firestore
        .collection(collection)
        .snapshots();
  }
}
