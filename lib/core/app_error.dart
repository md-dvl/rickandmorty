class AppError {
  AppError({
    this.statusCode,
    this.text,
    this.error,
  });
  final int? statusCode;
  final String? text;
  final String? error;
}
