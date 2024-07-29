import 'package:common/common.dart';
import 'package:flutter_bloc_starter/features/authentication/data/data_sources/models/token_local.dart';
import 'package:schemas/mutations/generated/Login.graphql.dart';

final class LoginResponseToLocalMapper
    implements Mapper<MutationLoginlogin, TokenLocal> {
  @override
  TokenLocal map(MutationLoginlogin input) {
    return TokenLocal(
      expires: input.accessToken.expires,
      token: input.accessToken.token,
    );
  }
}
