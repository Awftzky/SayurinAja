class UserResponse {
  final String? succeed;
  final String? error;

  UserResponse({this.succeed, this.error});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      succeed: json["succeed"],
      error: json["error"],
    );
  }
}
