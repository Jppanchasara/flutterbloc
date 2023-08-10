abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmmitedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmmitedEvent(this.email, this.password);
}
