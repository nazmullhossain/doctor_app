class RegistrationModel {
  String name;
  String email;
  String phone;
  String username;
  String password;
  String confirmPassword;

  RegistrationModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.confirmPassword,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      password: json['password'],
      confirmPassword: json['confirm_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}