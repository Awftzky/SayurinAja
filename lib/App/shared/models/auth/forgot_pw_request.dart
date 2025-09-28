class ForgotPwRequest {
  final String email;

  ForgotPwRequest({required this.email});

  Map<String, dynamic> toJson() {
    return {'Email': email};
  }
}

class VerifyOtpRequest {
  final String code;

  VerifyOtpRequest({required this.code});

  Map<String, dynamic> toJson() {
    return {'Code': code};
  }
}

class NewPasswordRequest {
  final String password;
  final String confirmedPassword;

  NewPasswordRequest({
    required this.password,
    required this.confirmedPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'Password': password,
      'Confirmed_password': confirmedPassword,
    };
  }
}
