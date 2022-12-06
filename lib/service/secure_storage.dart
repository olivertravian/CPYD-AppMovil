import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyUsername = 'username';
  static const _keyEmail = 'email';
  static const _keyPicture = 'picture';
  static const _keyRole = 'role';
  static const _keyToken = 'token';
  static const _keyJWT = 'jwt';

  static Future saveWithJwt(String token, String jwt) async {
    // Decode jwt
    final Map<String, dynamic> payload = Jwt.parseJwt(jwt);

    // User data
    final String email = (payload['email'] ?? 'unknown').toString();
    const String name = "";
    const String picture = "assets/user.png";
    const String role = "Estudiante";

    // Store all data
    await _storage.write(key: _keyUsername, value: name);
    await _storage.write(key: _keyEmail, value: email);
    await _storage.write(key: _keyPicture, value: picture);
    await _storage.write(key: _keyRole, value: role);
    await _storage.write(key: _keyToken, value: token);
    await _storage.write(key: _keyJWT, value: jwt);
  }

  static Future setUsername(String username) async =>
      await _storage.write(key: _keyUsername, value: username);

  static Future<String?> getUsername() async =>
      await _storage.read(key: _keyUsername);

  static Future setEmail(String email) async =>
      await _storage.write(key: _keyEmail, value: email);

  static Future<String?> getEmail() async =>
      await _storage.read(key: _keyEmail);

  static Future setPicture(String picture) async =>
      await _storage.write(key: _keyPicture, value: picture);

  static Future<String?> getPicture() async =>
      await _storage.read(key: _keyPicture);

  static Future setRole(String role) async =>
      await _storage.write(key: _keyRole, value: role);

  static Future<String?> getRole() async =>
      await _storage.read(key: _keyRole);

  static Future setToken(String token) async =>
      await _storage.write(key: _keyToken, value: token);

  static Future<String?> getToken() async =>
      await _storage.read(key: _keyToken);

  static Future setJwt(String jwt) async =>
      await _storage.write(key: _keyJWT, value: jwt);

  static Future<String?> getJwt() async =>
      await _storage.read(key: _keyJWT);

  static Future<bool> isJwtExpired(String jwt) async =>
      Jwt.isExpired(jwt);
}
