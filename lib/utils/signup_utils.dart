class SignUpUtils{


  static bool isValidEmail(String email) {
    //
    final emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$');
    return emailRegex.hasMatch(email);
  }
}