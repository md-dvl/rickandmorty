class AppError {
  AppError({
    this.statusCode,
    this.text,
  });
  final int? statusCode;
  final String? text;
}
