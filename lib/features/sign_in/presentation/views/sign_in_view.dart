import 'package:flutter/material.dart';
import 'package:task_firebase/features/sign_in/presentation/views/widgets/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(

      body: SignInBody(),
    ));
  }
}
