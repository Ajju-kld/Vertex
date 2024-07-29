import 'dart:io';
import 'package:formz/formz.dart';

class ProfileImage extends FormzInput<File?, String> {
  const ProfileImage.pure() : super.pure(null);
  const ProfileImage.dirty([File? value]) : super.dirty(value);

  @override
  String? validator(File? value) {
    print(value?.path?.split('.').last);
    final allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
    final extension = value?.path?.toLowerCase().split('.').last;
    print(extension);
    if (value != null && value.lengthSync() > 2 * 1024 * 1024) {
      return 'File size exceeds the limit of 15MB.';
    }
    if (!allowedExtensions.contains(extension)) {
      return 'Invalid file type. Only image files are allowed.';
    }
    return null;
  }
}
