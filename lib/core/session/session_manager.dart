class SessionManager {
  String? _token;

  //? save token to session
  void saveToken(String token) => _token = token;

  String? get token => _token;
}
