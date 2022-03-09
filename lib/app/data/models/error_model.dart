class ErrorModel {
  final String header;
  final String message;
  final Map<String, dynamic> problems;
  final String buttonTitle;
  final Function()? callback;

  ErrorModel(
      {required this.header,
      required this.message,
      this.callback,
      this.buttonTitle = 'TRY AGAIN',
      this.problems = const {}});
}
