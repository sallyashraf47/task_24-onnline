import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_firebase/features/sign_in/presentation/views/sign_in_view.dart';
import 'package:task_firebase/features/wish_list/presentation/views/widgets/wish_list_bloc_builder.dart';
import '../../../../core/utils/widget/show_snack_bar.dart';
import '../manger/wish_list/wish_list_cubit.dart';
class WishListView extends StatefulWidget {
   WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  TextEditingController text = TextEditingController();
  GlobalKey globalKey=GlobalKey();
@override
  void dispose() {
  text.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
          actions: [IconButton(onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>   const SignInView()),
            );
           await auth.signOut();

          }, icon:Icon (Icons.logout_rounded))],
        ),

        body:  const WishListViewBlocBuilder(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,

          onPressed: () async {
        await
            showDialog(
              context: context,
              builder: (BuildContext context) {

                return AlertDialog(
                  title: const Text('Add Wish'),
                  content: Form(
                    key:globalKey ,
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "value is empty";
                        }
                      },
                      controller: text,
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        showSnackBar(context, 'Done Add new wishlist  ');

                        await BlocProvider.of<WishListCubit>(context).addWishListEntry(context,text.text);

                      },
                      child: const Text('Save'),
                    ),
                  ],
                );
              },
            );



          },

          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}




