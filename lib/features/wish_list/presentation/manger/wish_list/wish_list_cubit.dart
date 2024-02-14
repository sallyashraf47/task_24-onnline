import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/wish_entity.dart';
import '../../../domain/repo/wish_list_repo.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit({required this.wishListRepo}) : super(WishListInitial());
  final WishListRepo wishListRepo;
  fetchWishList(){
   var wishList= wishListRepo.fetchWishList();
  emit(WishListSuccess(wishList));

  }
  editWishListEntry(BuildContext context,{required String id,required String newText}) async {
    wishListRepo.editWish(id, newText);
  }
  addWishListEntry(BuildContext context,String text) async {



    await FirebaseFirestore.instance.collection('wishList').add({
      'text': text,
      'createdAt': DateTime.now(),
    });

  }
  deleteWishListEntry(String id) async {
    await wishListRepo.deleteWish(id);
  }


}


