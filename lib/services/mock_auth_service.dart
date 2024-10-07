import 'package:financy_app/common/models/user_model.dart';
import 'package:financy_app/services/auth_service.dart';

class MockAuthService implements AuthService{
  @override
  Future<UserModel> signIn({required String email, required String password}) async{
    try {
      await Future.delayed(const Duration(seconds: 2));
      if(password.startsWith('123')){
        throw Exception();
      }
      return UserModel(id: email.hashCode, email: email);
    } catch (e) {
      if(password.startsWith('123')){
        throw 'Erro ao logar!';
      }
      throw 'Não foi possível realizar login. Tente novamente';
    }
  }

  @override
  Future<UserModel> signUp({String? name, required String email, required String password}) async{
    try {
      await Future.delayed(const Duration(seconds: 2));
      if(password.startsWith('123')){
        throw Exception();
      }
      return UserModel(id: email.hashCode, name: name, email: email);
    } catch (e) {
      if(password.startsWith('123')){
        throw 'Senha insegura. Digite uma nova senha';
      }
      throw 'Não foi possível criar a conta. Tente novamente';
    }
  }
}