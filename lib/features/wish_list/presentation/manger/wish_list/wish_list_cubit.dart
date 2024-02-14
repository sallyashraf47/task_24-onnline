import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/helper/check_network.dart';
import '../../../domain/entity/wish_entity.dart';
import '../../../domain/repo/wish_list_repo.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit({required this.wishListRepo}) : super(WishListInitial());
  final WishListRepo wishListRepo;
  fetchWishList() async {
    bool connected=await checkInternetConnectivity();
    if (!connected) {
      emit(WishListFailureNetwork());
    }
    emit(WishListLoading());
    Stream <List<WishListEntry>> wishList= wishListRepo.fetchWishList();
  emit(WishListSuccess(wishList));

  }
  editWishListEntry(BuildContext context,{required String id,required String newText}) async {
    bool connected=await checkInternetConnectivity();
    if (!connected) {
      emit(WishListFailureNetwork());
    }
    wishListRepo.editWish(id, newText);
  }
  addWishListEntry(BuildContext context,String text) async {
bool connected=await checkInternetConnectivity();
    if (!connected) {
  emit(WishListFailureNetwork());
    }
    await wishListRepo.addWish(text);


  }
  deleteWishListEntry(String id) async {
    bool connected=await checkInternetConnectivity();
    if (!connected) {
      emit(WishListFailureNetwork());
    }
    await wishListRepo.deleteWish(id);
  }


}


