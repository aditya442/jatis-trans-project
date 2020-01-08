import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => null;
}

class LoginInitial extends LoginState {}

class LoginHome extends LoginState {
   final String userName;
   final String phoneNo;
   final String userId;

  const LoginHome({@required this.userName, this.phoneNo,this.userId});
}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
