import 'package:flutter/foundation.dart' show immutable;
import 'package:now_vibes/posts/user_id.dart';
import 'package:now_vibes/state-auth/auth_results.dart';

@immutable

/// this meaning 'AuthState' properties cannot be changed once they are set.
class AuthState {
  AuthResult? result;
  final bool isLoading;
  final UserId? userId;

  AuthState(
      {required this.result, required this.isLoading, required this.userId});
  AuthState.unKnown()
      : result = null,
        isLoading = false,
        userId = null;

  /// -copy of the clas wih diffrient value of isLoading
  /// we do this beaause if the resultre is null the isLoading will be true and loading
  /// - even resul is unknown isLoading is set to true
  AuthState copiedWithIsLoading(bool isLoading) =>
      AuthState(result: result, isLoading: isLoading, userId: userId);

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId);

  @override
  int get hashCode => Object.hash(result, isLoading, userId);
}
