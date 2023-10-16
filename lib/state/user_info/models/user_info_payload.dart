import 'dart:collection' show MapView;

import 'package:flutter/foundation.dart' show immutable;
import 'package:now_vibes/posts/user_id.dart';
import 'package:now_vibes/state/constants/firebase_field_name.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displayName: displayName ?? '',
          FirebaseFieldName.email: email ?? '',
        });
}
