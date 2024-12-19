class ApiErrorModel {
  final String? message;
  final int code;

  ApiErrorModel({required this.code, this.message});

  // Factory constructor to create an instance from JSON
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      code: json['code'] as int,
      message: json['message'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
    };
  }
}
