import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_firebase/features/wish_list/domain/entity/wish_entity.dart';
import 'package:task_firebase/features/wish_list/presentation/manger/wish_list/wish_list_cubit.dart';

import '../../../../../core/utils/widget/show_snack_bar.dart';


class WishListWidget extends StatefulWidget {
  const WishListWidget({super.key, required this.wishListEntry});
final WishListEntry wishListEntry;
  @override
  State<WishListWidget> createState() => _WishListWidgetState();
}

class _WishListWidgetState extends State<WishListWidget> {
  late TextEditingController controller ;
@override
  void initState() {
  controller=TextEditingController(text: widget.wishListEntry.text);
  super.initState();
  }
  @override
  void dispose() {
controller.dispose();
super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: ListTile(
        title: Text(widget.wishListEntry.text),
        //subtitle: Text('Created at: ${entry.createdAt}'),
      
      
      
        trailing: Row(mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.delete,color: Colors.red),
              onPressed: () async {
                showSnackBar(context, 'Done delete  wishlist  ');

                await BlocProvider.of<WishListCubit>(context).deleteWishListEntry( widget.wishListEntry.id);

              },
      
      
            ),IconButton(
              icon: Icon(Icons.edit),
      
              onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
      
                    return AlertDialog(
                      backgroundColor: Colors.white,
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
                          onPressed: () async {
                            Navigator.pop(context, );
                            showSnackBar(context, 'Done edit wishlist  ');

                            await BlocProvider.of<WishListCubit>(context).editWishListEntry(
                                context, id: widget.wishListEntry.id, newText: controller.text);
      
                          },
                          child: Text('Save'),
                        ),
                      ],
                    );
                  },
                );
        },
      
            ),
          ],
        ),
      ),
    );
  }
}
