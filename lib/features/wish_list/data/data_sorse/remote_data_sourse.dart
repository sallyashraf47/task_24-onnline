import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_firebase/features/wish_list/domain/entity/wish_entity.dart';

  class RemoteWishDataSource {
  final CollectionReference _wishCollection =
  FirebaseFirestore.instance.collection('wishList');

  Future<void> addWish(String text) async {
    await _wishCollection.add({
      'text': text,
      'createdAt': DateTime.now(),
    });
  }

  Future<void> editWish(String id, String newText) async {
    await _wishCollection.doc(id).update({'text': newText});
  }

  Future<void> deleteWish(String id) async {
    await _wishCollection.doc(id).delete();
  }

  Stream<List<WishListEntry>> getWishList() {
    return _wishCollection.orderBy('createdAt', descending: true).snapshots().map(
          (snapshot) => snapshot.docs
          .map((doc) => WishListEntry(
        id: doc.id,
        text: doc['text'],
        createdAt: doc['createdAt'].toDate(),
      ))
          .toList(),
    );
  }
}
