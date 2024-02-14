part of 'wish_list_cubit.dart';

@immutable
abstract class WishListState {}

class WishListInitial extends WishListState {}
class WishListLoading extends WishListState {}
class WishListSuccess extends WishListState {
final Stream <List<WishListEntry> > wishListEntry;

  WishListSuccess(this.wishListEntry);
}
class WishListFailure extends WishListState {
  final String errorMassage;

  WishListFailure(this.errorMassage);
}
