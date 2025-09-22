class UserResponse {
  final String? kode;
  final String? error;
  final String? message;
  final String? succeed;

  UserResponse({this.kode, this.error, this.message, this.succeed});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      kode: json["kode"],
      error: json["error"],
      message: json["message"],
      succeed: json["succeed"],
    );
  }

  /// HELPER
  bool get isSuccess =>
      error == null && (message != null || kode != null || succeed != null);
  bool get hasError => error != null;
  String get errorMessage => error ?? "Unknown error";
}
