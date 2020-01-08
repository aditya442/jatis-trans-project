import 'dart:async';
import 'package:app/repository/repository.dart';
import 'package:bloc/bloc.dart';
import './login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginAppInitial) {
      yield LoginInitial();
    }

    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        String statusError;
        String userName;
        String phoneNo;
        String userId;


        await UserRepository()
            .login(
          email: event.email,
          password: event.password,
        )
            .then((e) {
          statusError = e.status;
          userName = e.userName;
          userId = e.userId;
          phoneNo = e.phoneNo;
        });

        if (statusError == 'success') {
          yield LoginHome(userName: userName, userId: userId,phoneNo:phoneNo);
        } else if (statusError == 'error') {
          yield LoginFailure(error: 'Login gagal silahkan periksa kembali');
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
