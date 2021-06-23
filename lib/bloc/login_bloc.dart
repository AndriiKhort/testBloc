import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:q/bloc/login_event.dart';
import 'package:q/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is GoToNextPageEvent) {
      yield state.copyWith(isGoToNextPage: true);
    } else if (event is OnEmailChangeEvent) {
      yield state.copyWith(email: event.email);
    } else if (event is OnPasswordChangeEvent) {
      yield state.copyWith(password: event.password);
    } else if (event is GoToBackPageEvent) {
      yield state.copyWith(isGoToNextPage: false, isGoToSecondPage: false,isGoToThirdPage: false);
    } else if (event is GoToSecondPageEvent) {
      yield state.copyWith(isGoToSecondPage: true);
    } else if (event is GoToThirdPageEvent) {
      yield state.copyWith(isGoToThirdPage: true);
    }
  }
}
