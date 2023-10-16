import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:now_vibes/backend/authenticator.dart';
import 'package:now_vibes/posts/user_id.dart';
import 'package:now_vibes/state-auth/auth_results.dart';
import 'package:now_vibes/state-auth/auth_stat.dart';
import 'package:now_vibes/state/user_info/models/backend/user_info_storage.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final authenticator = const Authenticator();
  final userInfoStorage = UserInfoStorage();
  AuthNotifier() : super(const AuthState.unKnown()) {
    // if we are already login that emmited a new  state
    if (authenticator.isAlreadyLoggedIn) {
      state = AuthState(
          result: AuthResult.success,
          isLoading: false,
          userid: authenticator.userId);
    }
  }
  // it is diefieriente from authinticator that is the state
  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await authenticator.logOut();
    // this meam log out
    state = const AuthState.unKnown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await authenticator.loginWithGoogle();
    final userId = authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      // store data in firebase
      await saveUserInfo(userId: userId);
    }
    state = AuthState(result: result, isLoading: false, userid: userId);
  }

  Future<void> saveUserInfo({required UserId userId}) =>
      userInfoStorage.SaveUserInfo(
          userId: userId,
          displayName: authenticator.displayName,
          email: authenticator.email);
}

/// every state notifier must have initial state
