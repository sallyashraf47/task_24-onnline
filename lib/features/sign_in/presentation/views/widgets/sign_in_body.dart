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
        return ElevatedButton(onPressed: () async {
          await BlocProvider.of<SignInCubit>(context).signInUser();
        }, child: const Text("sign In"));
      },
      listener: (BuildContext context, SignInState state) {

       if(state is SignFailure){
          showSnackBar(context, state.errorMassage);

        }
        else if(state is SignSuccess){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const WishListView()),
          );
        }
      },
    );
  }
}
