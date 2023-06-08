import 'package:get_storage/get_storage.dart';

class GlobalStorage {
  final GetStorage _box;
  const GlobalStorage(
    this._box,
  );

  final String _tokenKey = 'accessToken';
  final String _emailKey = 'accessEmail';
  final String _nameKey = 'accessName';
  final String _passwordKey = 'accessPassword';

  /// Save Token
  void saveToken({required String accessToken}) {
    if (accessToken.isEmpty) {
      throw 'Access Token is empty';
    }
    _box.write(_tokenKey, accessToken);
  }

  String getToken() {
    String? token = _box.read(_tokenKey);
    return token ?? '';
  }

  void removeToken() {
    _box.remove(_tokenKey);
  }

  ///save Email
  void saveEmail({required String emailId}) {
    if (emailId.isEmpty) {
      throw 'Email is empty';
    }
    _box.write(_emailKey, emailId);
    print(_emailKey);
  }

  String getEmail() {
    String? email = _box.read(_emailKey);
    return email ?? '';
  }

  void removeEmail() {
    _box.remove(_emailKey);
  }

  ///save Password

  void savePassword({required String password}) {
    if (password.isEmpty) {
      throw 'Password is empty';
    }
    _box.write(_passwordKey, password);
  }

  String getPassword() {
    String? password = _box.read(_passwordKey);
    return password ?? '';
  }

  void removePassword() {
    _box.remove(_passwordKey);
  }

  ///save name

  void saveName({required String name}) {
    if (name.isEmpty) {
      throw 'Name is empty';
    }
    _box.write(_nameKey, name);
  }

  String getName() {
    String? name = _box.read(_nameKey);
    return name ?? '';
  }

  void removeName() {
    _box.remove(_nameKey);
  }
}
