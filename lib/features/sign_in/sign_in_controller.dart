
import 'package:financy_app/features/sign_in/sign_in_state.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class SignInController extends ChangeNotifier{
  final AuthService _service;
  SignInController(this._service);
  SignInState state = SignInInitialState();

  void changeState(SignInState newState){
    state = newState;
    notifyListeners();
  }

  Future<bool> doSignIn({required String email, required String password}) async {
    changeState(SignInLoadingState());

    try{
      _service.signIn(email: email, password: password);

      changeState(SignInSucessState());
      return true;
    }catch(e){
      changeState(SignInErrorState(e.toString()));
      return false;
    }
  }
}