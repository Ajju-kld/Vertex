part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class UsernameChanged extends LoginEvent {
  const UsernameChanged(this.username);
  final String username;
  @override
  List<Object> get props => [username];
}

final class PasswordChanged extends LoginEvent {
  const PasswordChanged(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

final class LoginSubmitted extends LoginEvent{
  const LoginSubmitted();
}