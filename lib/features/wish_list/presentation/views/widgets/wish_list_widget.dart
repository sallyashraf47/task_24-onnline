import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_firebase/features/wish_list/domain/entity/wish_entity.dart';
import 'package:task_firebase/features/wish_list/presentation/manger/wish_list/wish_list_cubit.dart';


class WishListWidget extends StatefulWidget {
  const WishListWidget({super.key, required this.wishListEntry});
final WishListEntry wishListEntry;
  @override
  State<WishListWidget> createState() => _WishListWidgetState();
}

class _WishListWidgetState extends State<WishListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.wishListEntry.text),
      //subtitle: Text('Created at: ${entry.createdAt}'),



      trailing: Row(mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              print("object");
              return await BlocProvider.of<WishListCubit>(context).deleteWishListEntry( widget.wishListEntry.id);
            },


          ),IconButton(
            icon: Icon(Icons.edit),

            onPressed: () async {
              String newText = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  TextEditingController controller =
                  TextEditingController(text: widget.wishListEntry.text);
                  return AlertDialog(
                    title: Text('Edit Wish'),
                    content: TextField(
                      controller: controller,
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, controller.text);
                        },
                        child: Text('Save'),
                      ),
                    ],
                  );
                },
              );
    if (newText != null && newText.isNotEmpty) {
      await BlocProvider.of<WishListCubit>(context).editWishListEntry(
          context, id: widget.wishListEntry.id, newText: newText.toString());
    } },

          ),
        ],
      ),
    );
  }
}
