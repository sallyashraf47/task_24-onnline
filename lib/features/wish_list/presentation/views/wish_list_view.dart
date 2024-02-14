import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_firebase/features/wish_list/presentation/views/widgets/wish_list.dart';

import '../manger/wish_list/wish_list_cubit.dart';




class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
        ),

        body:  WishList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String text = await
            showDialog(
              context: context,
              builder: (BuildContext context) {
                TextEditingController controller = TextEditingController();
                return AlertDialog(
                  title: const Text('Add Wish'),
                  content: TextField(
                    controller: controller,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, controller.text);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                );
              },
            );

            if (text != null && text.isNotEmpty) {
              await BlocProvider.of<WishListCubit>(context).addWishListEntry(context,text);

            }

          },

          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }


}




