import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
    Future<void> signInUser()async {
    emit(SignInLoading());
    try{
      UserCredential user =   await FirebaseAuth.instance.signInAnonymously();

      emit(SignSuccess());
    }
    on FirebaseAuthException catch (ex) {
      if (ex.code == 'operation-not-allowed') {
        emit(SignFailure(errorMassage: 'operation-not-allowed'));
      }
    } catch (ex) {
      emit(SignFailure(errorMassage: 'Unknown error.'));

    }

  }
}



