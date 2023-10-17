import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:now_vibes/state-auth/auth_stat.dart';
import 'package:now_vibes/state-auth/authnotifirers/auth_state_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (_) => AuthStateNotifier());
