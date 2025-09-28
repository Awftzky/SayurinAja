class ForgotPwResponse<T> {
  final String? message;
  final T? data;
  final String? error;

  ForgotPwResponse({
    this.message,
    this.data,
    this.error,
  });

  factory ForgotPwResponse.success(T data, [String? message]) {
    return ForgotPwResponse<T>(
      data: data,
      message: message,
    );
  }

  factory ForgotPwResponse.error(String error) {
    return ForgotPwResponse<T>(
      error: error,
    );
  }
}

class OtpResponse {
  final String kode;

  OtpResponse({required this.kode});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(kode: json['kode'] ?? '');
  }
}

class NewPasswordResponse {
  final String? message;
  final String? error;

  NewPasswordResponse({this.message, this.error});

  factory NewPasswordResponse.fromJson(Map<String, dynamic> json) {
    return NewPasswordResponse(
      message: json['message'],
      error: json['error'],
    );
  }
}
