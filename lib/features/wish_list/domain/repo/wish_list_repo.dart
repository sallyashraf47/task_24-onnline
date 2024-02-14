import 'package:dartz/dartz.dart';
import 'package:task_firebase/features/wish_list/domain/entity/wish_entity.dart';

import '../../../../core/error/failure.dart';

abstract class WishListRepo {
  Future<void> addWish(String text);
  Future<void> editWish(String id, String newText);
  Future<void> deleteWish(String id);
  Stream <List<WishListEntry> >fetchWishList(
      );

}
