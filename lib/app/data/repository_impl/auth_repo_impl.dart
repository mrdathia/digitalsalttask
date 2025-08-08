import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:digitalsalttask/app/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static final GetStorage _storage = GetStorage();

  static const String _tokenKey = "auth_token";

  /// Login with email & password
  @override
  static Future<bool> login({required String email, required String password}) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

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
  static Future<bool> isLoggedIn() async {
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
  static Future<bool> signUp({required String email, required String password}) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

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

  /// Google sign up / login
  @override
  static Future<bool> googleSignUp() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(scopeHint: ['email', 'profile']);
      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth =
      googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCred =
      await _auth.signInWithCredential(credential);

      String? token = await userCred.user?.getIdToken();
      if (token != null) {
        await _saveToken(token);
        log("Token stored after Google sign-in: $token");
      }

      return true;
    } on FirebaseAuthException catch (e, stack) {
      log("FirebaseAuthException in googleSignUp: ${e.code}\nStack: $stack");
      return false;
    } catch (error, stack) {
      log("Error in googleSignUp: $error\nStack: $stack");
      return false;
    }
  }

  /// Check if logged in with Google
  @override
  static Future<bool> googleIsLoggedIn() async {
    try {
      return _auth.currentUser != null &&
          _auth.currentUser!.providerData.any(
                (provider) => provider.providerId == 'google.com',
          );
    } catch (error, stack) {
      log("Error in googleIsLoggedIn: $error\nStack: $stack");
      return false;
    }
  }

  /// Logout & clear session
  @override
  static Future<void> logout() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      await _storage.remove(_tokenKey);
      log("User logged out & token cleared");
    } catch (error, stack) {
      log("Error in logout: $error\nStack: $stack");
    }
  }

  /// Save token securely
  static Future<void> _saveToken(String token) async {
    await _storage.write(_tokenKey, token);
  }

  /// Get token from secure storage
  static Future<String?> _getToken() async {
    return _storage.read(_tokenKey);
  }
}
