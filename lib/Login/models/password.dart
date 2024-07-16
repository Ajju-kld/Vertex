import 'package:formz/formz.dart';

enum PasswordValidator { valid, empty, short, notmatch, invalid }

class Password extends FormzInput<String, PasswordValidator> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidator? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidator.empty;
    }
    if (value.length < 6) {
      return PasswordValidator.short;
    }
    return null;
  }
}
