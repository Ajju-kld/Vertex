part of 'register_bloc.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.termsAccepted = false,
    this.status = FormzSubmissionStatus.initial,
  this.isValid = false,
  });
  final Username username;
  final Email email;
  final Password password;
  final Password confirmPassword;
  final bool termsAccepted;
  final FormzSubmissionStatus status;
  final bool isValid;

  RegisterState copyWith({
    Username? username,
    Email? email,
    Password? password,
    Password? confirmPassword,
    bool? termsAccepted,
    FormzSubmissionStatus? status,
    bool? isValid,

  }) {
    return RegisterState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        termsAccepted: termsAccepted ?? this.termsAccepted,
        status: status ?? this.status,
        isValid: isValid??this.isValid);
        
  }

  @override
  List<Object> get props =>
      [username, email, password, confirmPassword, termsAccepted, status,isValid];
}
