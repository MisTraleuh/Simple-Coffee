import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  final String email;
  final String password;
  final String confirmedPassword;
  final String username;
  final bool isAlreadyRegistered;

  const UserPreferences({
    required this.email,
    required this.password,
    required this.confirmedPassword,
    required this.username,
    required this.isAlreadyRegistered,
  });

  const UserPreferences.unknown()
      : email = 'unknown',
        password = 'unknown',
        confirmedPassword = 'unknown',
        username = 'unknown',
        isAlreadyRegistered = false;

  UserPreferences copyWith({
    String? email,
    String? password,
    String? confirmedPassword,
    String? username,
    bool? isAlreadyRegistered,
  }) => UserPreferences(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        username: username ?? this.username,
        isAlreadyRegistered: isAlreadyRegistered ?? this.isAlreadyRegistered,
      );

  factory UserPreferences.fromJson(Map<String, dynamic> json) => UserPreferences(
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
  bool operator ==(covariant UserPreferences other) =>
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

 static Future<void> saveUserPreferences(UserPreferences userPreferences) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', userPreferences.email);
    await prefs.setString('password', userPreferences.password);
    await prefs.setString('confirmedPassword', userPreferences.confirmedPassword);
    await prefs.setString('username', userPreferences.username);
    await prefs.setBool('isAlreadyRegistered', userPreferences.isAlreadyRegistered);
  }

  static Future<UserPreferences> getUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? '';
    final password = prefs.getString('password') ?? '';
    final confirmedPassword = prefs.getString('confirmedPassword') ?? '';
    final username = prefs.getString('username') ?? '';
    final isAlreadyRegistered = prefs.getBool('isAlreadyRegistered') ?? false;

    return UserPreferences(
      email: email,
      password: password,
      confirmedPassword: confirmedPassword,
      username: username,
      isAlreadyRegistered: isAlreadyRegistered,
    );
  }

}
