
class User {
  final String email;
  final String password;
  final String confirmedPassword;
  final String username;
  final bool isAlreadyRegistered;

  const User({
    required this.email,
    required this.password,
    required this.confirmedPassword,
    required this.username,
    required this.isAlreadyRegistered,
  });

  const User.unknown()
      : email = 'unknown',
        password = 'unknown',
        confirmedPassword = 'unknown',
        username = 'unknown',
        isAlreadyRegistered = false;

  User copyWith({
    String? email,
    String? password,
    String? confirmedPassword,
    String? username,
    bool? isAlreadyRegistered,
  }) =>
      User(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        username: username ?? this.username,
        isAlreadyRegistered: isAlreadyRegistered ?? this.isAlreadyRegistered,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'] as String,
        password: json['password'] as String,
        confirmedPassword: json['confirmed_password'] as String,
        username: json['username'] as String,
        isAlreadyRegistered: json['is_already_registered'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'password': password,
        'confirmed_password': confirmedPassword,
        'username': username,
        'is_already_registered': isAlreadyRegistered,
      };

  @override
  bool operator ==(covariant User other) =>
      identical(this, other) ||
      (email == other.email &&
          password == other.password &&
          confirmedPassword == other.confirmedPassword &&
          username == other.username &&
          isAlreadyRegistered == other.isAlreadyRegistered);

  @override
  int get hashCode => Object.hash(email, password, confirmedPassword, username, isAlreadyRegistered);

  @override
  String toString() =>
      'User: {email: $email, password: $password, confirmedPassword: $confirmedPassword, username: $username, isAlreadyRegistered: $isAlreadyRegistered}';
}
