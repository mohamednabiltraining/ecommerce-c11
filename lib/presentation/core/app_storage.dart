import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String token = "token";

class AppStorage {
  static setToken(value) async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: token, value: value);
  }

  static Future<String?> getToken() async {
    const secureStorage = FlutterSecureStorage();
    return await secureStorage.read(key: token);
  }
}
