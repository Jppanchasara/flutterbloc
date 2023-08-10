import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screens/sign_in_email/bloc/sign_in_event.dart';
import 'package:flutterbloc/screens/sign_in_email/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInIntialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (event.emailValue == "" &&
          EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email adress"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState("Please enter a valid password"));
      } else {
        emit(SingInValidState());
      }
    });
    on<SignInSubmmitedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
