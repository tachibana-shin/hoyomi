class User {
  final String user;
  final String? email;
  final String photoUrl;
  final String fullName;
  final Sex sex;

  User({
    required this.user,
    required this.email,
    required this.photoUrl,
    required this.fullName,
    this.sex = Sex.other,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user: json['user'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      fullName: json['fullName'],
      sex: Sex.values.firstWhere((e) => e.toString() == 'Sex.${json['sex']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'email': email,
      'photoUrl': photoUrl,
      'fullName': fullName,
      'sex': sex.toString().split('.').last,
    };
  }
}

enum Sex { male, female, other }
