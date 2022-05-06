import 'package:meta/meta.dart';

import 'package:flutter_clean_arch_tdd/domain/entities/entities.dart';

abstract class Authentication {
  Future<AccountEntity> auth({
    @required String email,
    @required String password,
  });
}
