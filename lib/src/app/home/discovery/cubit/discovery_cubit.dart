import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiscoveryCubit {
  Future load() async {
    final DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);

    final DocumentSnapshot userDocSnapshot = await userDocRef.get();
    userDocSnapshot.data() as Map<String, Object?>;
  }
}
