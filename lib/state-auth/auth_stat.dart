import 'package:flutter/foundation.dart' show immutable;
import 'package:now_vibes/posts/user_id.dart';
import 'package:now_vibes/state-auth/auth_results.dart';

@immutable

/// this meaning 'AuthState' properties cannot be changed once they are set.
class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final UserId? userId;

  const AuthState(
      {required this.result, required this.isLoading, required this.userId});
  const AuthState.unKnown()
      : result = null,
        isLoading = false,
        userId = null;

  /// copy of the clas wih diffrient value of isLoading
  /// we do this beaause if the resultre is null the isLoading will be true and loading
  AuthState copiedWithIsLoading(bool isLoading) {
    return AuthState(result: result, isLoading: isLoading, userId: userId);
  }

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId);

  @override
  int get hashCode => super.hashCode;
}
