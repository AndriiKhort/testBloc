import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isGoToNextPage;
  final String email;
  final String password;
  final bool isGoToBackPage;
  final bool isGoToSecondPage;
  final bool isGoToThirdPage;

  LoginState({
    this.isGoToNextPage = false,
    this.email,
    this.password,
    this.isGoToBackPage,
    this.isGoToSecondPage = false,
    this.isGoToThirdPage = false,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        isGoToNextPage,
        email,
        password,
        isGoToBackPage,
        isGoToSecondPage,
        isGoToThirdPage
      ];
  LoginState copyWith(
      {bool isGoToNextPage,
      String email,
      String password,
      bool isGoToBackPage,
      bool isGoToSecondPage,
      bool isGoToThirdPage}) {
    return LoginState(
      isGoToNextPage: isGoToNextPage ?? this.isGoToNextPage,
      email: email ?? this.email,
      password: password ?? this.password,
      isGoToBackPage: isGoToBackPage ?? this.isGoToBackPage,
      isGoToSecondPage: isGoToSecondPage ?? this.isGoToSecondPage,
      isGoToThirdPage: isGoToThirdPage ?? this.isGoToThirdPage,
    );
  }
}
