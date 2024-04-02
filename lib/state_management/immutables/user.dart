
class User {
  final String email;
  final String password;
  final String confirmedPassword;
  final String username;

  const User({
    required this.email,
    required this.password,
    required this.confirmedPassword,
    required this.username,
  });

  const User.unknown()
      : email = 'unknown',
        password = 'unknown',
        confirmedPassword = 'unknown',
        username = 'unknown';

  User copyWith({
    String? email,
    String? password,
    String? confirmedPassword,
    String? username,
  }) =>
      User(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        username: username ?? this.username,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'] as String,
        password: json['password'] as String,
        confirmedPassword: json['confirmed_password'] as String,
        username: json['username'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'password': password,
        'confirmed_password': confirmedPassword,
        'username': username,
      };

  @override
  bool operator ==(covariant User other) =>
      identical(this, other) ||
      (email == other.email &&
          password == other.password &&
          confirmedPassword == other.confirmedPassword &&
          username == other.username);

  @override
  int get hashCode => Object.hash(email, password, confirmedPassword, username);

  @override
  String toString() =>
      'User: {email: $email, password: $password, confirmedPassword: $confirmedPassword, username: $username}';
}
