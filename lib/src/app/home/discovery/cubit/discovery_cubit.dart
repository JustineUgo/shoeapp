import 'package:cloud_firestore/cloud_firestore.dart';

class DiscoveryCubit {
  Filter? filter;

  // Future<void> _addToWishlist(String productId) async {
  //   await firestoreService.updateDocument(
  //     collection: 'users',
  //     docId: widget.userId,
  //     userData: {
  //       'wishlist': FieldValue.arrayUnion([productId])
  //     },
  //   );
  //   setState(() {
  //     _wishlist.add(productId);
  //   });
  // }

  // Future<void> _removeFromWishlist(String productId) async {
  //   await firestoreService.updateDocument(
  //     collection: 'users',
  //     docId: widget.userId,
  //     userData: {
  //       'wishlist': FieldValue.arrayRemove([productId])
  //     },
  //   );
  //   setState(() {
  //     _wishlist.remove(productId);
  //   });
  // }
}
