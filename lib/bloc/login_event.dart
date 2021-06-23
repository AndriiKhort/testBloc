import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent {}

class GoToNextPageEvent extends LoginEvent {}

class OnPasswordChangeEvent extends LoginEvent {
  OnPasswordChangeEvent({this.password});
  final String password;
}

class OnEmailChangeEvent extends LoginEvent {
  OnEmailChangeEvent({this.email});
  final String email;
}

class GoToBackPageEvent extends LoginEvent {}

class GoToSecondPageEvent extends LoginEvent {}

class GoToThirdPageEvent extends LoginEvent {}