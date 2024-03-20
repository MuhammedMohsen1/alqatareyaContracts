class CustomException implements Exception {
  final String message;

  CustomException([this.message = "A custom exception occurred."]);
  @override
  String toString() => message;
}
