import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:now_vibes/posts/user_id.dart';
import 'package:now_vibes/state/providers/auth_state_providers.dart';

// also this provder is watching userid in authStateProvider
final userIdProvider =
    Provider<UserId?>((ref) => ref.watch(authStateProvider).userId);
