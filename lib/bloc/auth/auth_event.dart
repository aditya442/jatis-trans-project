
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();


  @override 
  List<Object> get props =>null;
}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String email;
  final String password;
  final String userName;
  final String userId;
  final String phoneNo;

  const LoggedIn({@required this.email,this.password,this.userName,this.phoneNo,this.userId});

  @override 
  List<Object> get props => [email,password, userName];
}

class LoggedOut extends AuthEvent {}
