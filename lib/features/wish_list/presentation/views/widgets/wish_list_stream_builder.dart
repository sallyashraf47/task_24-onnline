import 'package:flutter/material.dart';
import 'package:task_firebase/features/wish_list/presentation/views/widgets/wish_list_widget.dart';

import '../../../domain/entity/wish_entity.dart';

class WishListStreamBuilder extends StatelessWidget {
 final Stream <List<WishListEntry> >wishListEntry;
  const WishListStreamBuilder({super.key, required this.wishListEntry});

  @override
  Widget build(BuildContext context) {
    return    StreamBuilder<List<WishListEntry>>(
      stream: wishListEntry,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
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
  }
}
