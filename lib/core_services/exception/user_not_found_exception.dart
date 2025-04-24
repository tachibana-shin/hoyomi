class UserNotFoundException implements Exception {
  final String message;
  final StackTrace trace;

  UserNotFoundException([this.message = 'User not found', StackTrace? trace])
    : trace = trace ?? StackTrace.current;

  @override
  String toString() {
    return "UserNotFoundException: $message\n$trace";
  }
}
