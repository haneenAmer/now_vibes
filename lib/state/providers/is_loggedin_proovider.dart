import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:now_vibes/state-auth/auth_results.dart';
import 'package:now_vibes/state/providers/auth_state_providers.dart';

///is not work alone but it is watch authstateprovider and
///dependent on auth (AuthState) result it should return bool
/// in this case we will need ref tp listen

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});
