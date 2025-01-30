class UserNotFoundException implements Exception {
  final String? message = 'User not found';

  const UserNotFoundException();
}
