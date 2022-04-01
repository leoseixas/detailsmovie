abstract class FailureMovie implements Exception {}

class ErrorFindDetailsMovie implements FailureMovie {
  final String message;
  ErrorFindDetailsMovie({this.message = ''});
}
