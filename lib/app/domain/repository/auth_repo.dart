abstract class AuthRepo{
  Future<bool> login({required String email, required String password}){
    throw UnimplementedError("Implement");
  }

  /// Sign out from both Firebase and Google
  Future<void> signOut() {
    throw UnimplementedError();
  }

  /// Restore session using stored token or Firebase currentUser
  Future<bool> restoreSession() {
    throw UnimplementedError();
  }

  /// Check if a user is logged in
  Future<bool> isLoggedIn() {
    throw UnimplementedError();
  }
}