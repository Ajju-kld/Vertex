import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:vertex/Authentication/bloc/authentication_bloc.dart';
import 'package:vertex/Login/models/models.dart';
import 'package:vertex/Repository/authentication_repository/authentication_repository.dart';
import 'package:vertex/Repository/user_repository/user_repository.dart';
import 'package:vertex/Signup/model/models.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(
      {required this.authenticationRepository,
   })
      : super(RegisterState())
 {
    on<RegisterUsernameChanged>(_onUsernameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegisterTermsAccepted>(_onTermsAccepted);
    on<RegisterSubmitted>(_onSubmitted);   
  }
final AuthenticationRepository authenticationRepository;




void _onUsernameChanged(
  RegisterUsernameChanged event,
  Emitter<RegisterState> emit,
){
    final username=Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username,state.email,state.password,state.confirmPassword]),
    ));
}

void _onEmailChanged(
  RegisterEmailChanged event,
  Emitter<RegisterState> emit,
){
    final email=Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([state.username,email,state.password,state.confirmPassword]),
    ));}
void _onPasswordChanged(
  RegisterPasswordChanged event,
  Emitter<RegisterState> emit,
){
    final password=Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([state.username,state.email,password,state.confirmPassword]),
    ));


}

void _onConfirmPasswordChanged(
  RegisterConfirmPasswordChanged event,
  Emitter<RegisterState> emit,
){
    final confirmPassword=Password.dirty(event.confirmPassword);
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      isValid: Formz.validate([state.username,state.email,state.password,confirmPassword]),
    ));


}

void _onTermsAccepted(
  RegisterTermsAccepted event,
  Emitter<RegisterState> emit,
){
    emit(state.copyWith(
      termsAccepted: event.accepted,
      isValid: Formz.validate([state.username,state.email,state.password,state.confirmPassword]),
    ));
}

void _onSubmitted(
  RegisterSubmitted event,
  Emitter<RegisterState> emit,
) async {
  if (state.isValid) {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
  }
  try {
    await authenticationRepository.signUp(
        username: state.username.value,
        email: state.email.value,
        password: state.password.value);
    emit(state.copyWith(status: FormzSubmissionStatus.success));

   
  } catch (e) {
    emit(state.copyWith(status: FormzSubmissionStatus.failure));
  }



}
}