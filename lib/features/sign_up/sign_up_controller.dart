
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:financy_app/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier{
  final AuthService _service;
  SignUpController(this._service);
  SignUpState state = SignUpInitialState();

  void changeState(SignUpState newState){
    state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp({required String name, required String email, required String password}) async {
    changeState(SignUpLoadingState());

    try{
      _service.signUp(name: name, email: email, password: password);

      changeState(SignUpSucessState());
      return true;
    }catch(e){
      changeState(SignUpErrorState(e.toString()));
      return false;
    }
  }
}