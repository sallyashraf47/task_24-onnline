import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_firebase/features/sign_in/presentation/manger/sign_in_cubit.dart';

import '../../../../../core/utils/widget/show_snack_bar.dart';
import '../../../../wish_list/presentation/views/wish_list_view.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(

      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTuTxJhRf3zVJkcSXFAwp7_DQWabIK1RM7gDh5xRwa4A&s'),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,

                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () async {
                await BlocProvider.of<SignInCubit>(context).signInUser();
              }, child: const Text("sign In",style: TextStyle(color: Colors.white,fontSize: 15),)),
            ),
          ],
        );
      },
      listener: (BuildContext context, SignInState state) {

       if(state is SignFailure){
          showSnackBar(context, state.errorMassage);

        }
        else if(state is SignSuccess){

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>   WishListView()),
          );
          showSnackBar(context, 'Done sign In ');

       }
      },
    );
  }
}
