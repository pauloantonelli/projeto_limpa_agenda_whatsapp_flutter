abstract class Failure implements Exception {}

class OpenChatWhatsappError extends Failure {
  final String message;
  OpenChatWhatsappError({this.message});
}

class NullError implements OpenChatWhatsappError {
  final String message;
  NullError({this.message});
}

class NegativeNumberError implements OpenChatWhatsappError {
  final String message;
  NegativeNumberError({this.message});
}

class NotNumberError implements OpenChatWhatsappError {
  final String message;
  NotNumberError({this.message});
}

class StringEmptyError implements OpenChatWhatsappError {
  final String message;
  StringEmptyError({this.message});
}

class OpenChatWhatsappRepositoryError extends Failure {
  final String message;
  OpenChatWhatsappRepositoryError({this.message});
}
