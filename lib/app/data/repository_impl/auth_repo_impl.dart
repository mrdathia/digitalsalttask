import 'dart:developer';

import 'package:digitalsalttask/app/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepoImpl extends AuthRepo {
  static final AuthRepoImpl _instance = AuthRepoImpl._internal();

  factory AuthRepoImpl() => _instance;

  AuthRepoImpl._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GetStorage _storage = GetStorage();

  final String _tokenKey = "auth_token";

  /// Login with email & password
  @override
  Future<bool> login({required String email, required String password}) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(email: email, password: password);

      String? token = await userCred.user?.getIdToken();
      if (token != null) {
        await _saveToken(token);
        log("Token stored: $token");
      }
      return true;
    } on FirebaseAuthException catch (e, stack) {
      log("FirebaseAuthException in login: ${e.code}\nStack: $stack");
      return false;
    } catch (error, stack) {
      log("Error in login: $error\nStack: $stack");
      return false;
    }
  }

  /// Check if user is logged in from session
  @override
  Future<bool> isLoggedIn() async {
    try {
      String? storedToken = await _getToken();
      if (storedToken != null && storedToken.isNotEmpty) {
        log("User already logged in with token: $storedToken");
        return true;
      }
      return false;
    } catch (error, stack) {
      log("Error in isLoggedIn: $error\nStack: $stack");
      return false;
    }
  }

  /// Sign up with email & password
  @override
  Future<bool> signUp({required String email, required String password}) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      String? token = await userCred.user?.getIdToken();
      if (token != null) {
        await _saveToken(token);
        log("Token stored after signup: $token");
      }
      return true;
    } on FirebaseAuthException catch (e, stack) {
      log("FirebaseAuthException in signUp: ${e.code}\nStack: $stack");
      return false;
    } catch (error, stack) {
      log("Error in signUp: $error\nStack: $stack");
      return false;
    }
  }

  /// Logout & clear session
  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _storage.remove(_tokenKey);
      log("User logged out & token cleared");
    } catch (error, stack) {
      log("Error in logout: $error\nStack: $stack");
    }
  }

  /// Save token securely
  Future<void> _saveToken(String token) async {
    await _storage.write(_tokenKey, token);
  }

  /// Get token from secure storage
  Future<String?> _getToken() async {
    return _storage.read(_tokenKey);
  }
}
