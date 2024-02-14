
import 'package:task_firebase/features/wish_list/domain/entity/wish_entity.dart';

import '../../domain/repo/wish_list_repo.dart';
import '../data_sorse/remote_data_sourse.dart';

class WishListRepoImpl implements WishListRepo {
  final RemoteWishDataSource remoteWishDataSource;

  WishListRepoImpl({required this.remoteWishDataSource});


  @override
  Future<void> addWish(String text) async {

    await remoteWishDataSource.addWish(text);
  }

  @override
  Future<void> editWish(String id, String newText) async {
    await remoteWishDataSource.editWish(id, newText);
  }

  @override
  Future<void> deleteWish(String id) async {
    await remoteWishDataSource.deleteWish(id);
  }

  @override
  Stream<List<WishListEntry>> fetchWishList() {
    return remoteWishDataSource.getWishList();
  }


}