
import 'package:formz/formz.dart';

class Email extends FormzInput<String, String> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"
  );


  @override
  String? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : 'Invalid email';
  }
}