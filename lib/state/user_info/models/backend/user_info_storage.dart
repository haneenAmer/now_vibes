import 'package:flutter/foundation.dart' show immutable;
import 'package:now_vibes/posts/user_id.dart';
import 'package:now_vibes/state/constants/firebase_collection_name.dart';
import 'package:now_vibes/state/constants/firebase_field_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:now_vibes/state/user_info/models/user_info_payload.dart';

@immutable
class UserInfoStorage {
  UserInfoStorage();

  Future<bool> SaveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      // check if we have rhe user info from befor
      final userInfo = await FirebaseFirestore.instance
          .collection(
            FirebaseCollectiondName.users,
          )
          .where(FirebaseCollectiondName.users, isEqualTo: userId)
          .limit(1)
          .get();
      if (userInfo.docs.isNotEmpty) {
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email ?? '',
        });

        return true;
      }

// we dont have this users information from before , creat new user
      final payload = UserInfoPayload(
          userId: userId, displayName: displayName, email: email);
      await FirebaseFirestore.instance
          .collection(FirebaseCollectiondName.users)
          .add(payload);
      return true;
    } catch (e) {
      return false;
    }
  }
}
