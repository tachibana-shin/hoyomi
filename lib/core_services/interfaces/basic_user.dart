class BasicUser {
  final String user;
  final String? email;
  final String photoUrl;
  final String fullName;
  final Sex sex;

  BasicUser(
      {required this.user,
      required this.email,
      required this.photoUrl,
      required this.fullName,
      this.sex = Sex.other});
}

enum Sex {
  male,
  female,
  other,
}
