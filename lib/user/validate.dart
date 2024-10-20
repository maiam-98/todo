String? validateEmail(String? value) {
  String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'ادخل البريد الالكتروني الصحيح';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  String pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&/])[A-Za-z\d@$!%*?&/]{8,}$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'لا يجب ان يكون فارغا';
  }
  else if (value.length < 8) {
    return "يجب ان تكون كلمة المرور مكونه من 8 ";
  }
  else if (!regex.hasMatch(value)) {
    return "يجب ان تحتوي على حرف صغير وكبير ورموز,";
  }
  return null;
}