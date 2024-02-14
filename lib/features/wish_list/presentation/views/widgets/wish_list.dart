import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_firebase/features/wish_list/presentation/manger/wish_list/wish_list_cubit.dart';
import 'package:task_firebase/features/wish_list/presentation/views/widgets/wish_list_widget.dart';

import '../../../domain/entity/wish_entity.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List <WishListEntry> wishListEntry=[];
    return BlocConsumer<WishListCubit, WishListState>(
      listener: (context, state) {

        if (state is WishListFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to load wish list.'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is WishListSuccess) {
          return StreamBuilder<List<WishListEntry>>(
            stream: state.wishListEntry,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('No wishes found.'),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final wish = snapshot.data![index];
                  return WishListWidget(wishListEntry: wish);
                },
              );
            },
          );
        } else if (state is WishListFailure) {
          return Center(
            child: Text('Failed to load wish list.'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
