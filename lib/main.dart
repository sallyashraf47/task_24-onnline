import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_firebase/features/sign_in/presentation/manger/sign_in_cubit.dart';
import 'package:task_firebase/features/sign_in/presentation/views/sign_in_view.dart';
import 'features/wish_list/data/data_sorse/remote_data_sourse.dart';
import 'features/wish_list/data/repo_impl/wish_list_repo_impl.dart';
import 'features/wish_list/presentation/manger/wish_list/wish_list_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(create: (context) => SignInCubit(),),
          BlocProvider(create: (context) => WishListCubit(wishListRepo: WishListRepoImpl(remoteWishDataSource: RemoteWishDataSource()))..fetchWishList(),),

        ],child:
    const MaterialApp(


      home: SignInView(),
    ));
  }
}




