import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_firebase/features/wish_list/presentation/manger/wish_list/wish_list_cubit.dart';
import 'package:task_firebase/features/wish_list/presentation/views/widgets/wish_list_stream_builder.dart';
import 'package:task_firebase/features/wish_list/presentation/views/widgets/wish_list_widget.dart';

import '../../../domain/entity/wish_entity.dart';

class WishListViewBlocBuilder extends StatelessWidget {
  const WishListViewBlocBuilder({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(

      builder: (context, state) {
        if (state is WishListSuccess) {
          return WishListStreamBuilder(wishListEntry: state.wishListEntry);
        } else if (state is WishListFailure) {
          return Center(
            child: Text(state.errorMassage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
