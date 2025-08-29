class UserResponse {
  final String status;

  UserResponse({required this.status});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json["status"] ?? "",
    );
  }
}
