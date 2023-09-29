import 'package:flutter/foundation.dart' show immutable;

@immutable
class Constants {
  static const accountExistsWithDifferetnCredential =
      'account-exist-with-different=credential';
  static const googleCom = 'google.com';
  static const emailScop = 'email';

  /// private constactor to not change from outside
  const Constants._();
}
