
bool validateIp(String ip) {
  return RegExp(r"^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$").hasMatch(ip);
}

bool validatePort(String port) {
  return RegExp(r"^[0-9]{1,5}$").hasMatch(port);
}

bool validateEmail(String email) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}
