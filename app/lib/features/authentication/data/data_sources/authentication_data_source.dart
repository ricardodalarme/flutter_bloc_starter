import 'package:common/common.dart';
import 'package:common_data/common_data.dart';
import 'package:schemas/fragments/generated/TokenFragment.graphql.dart';
import 'package:schemas/generated/schema.graphql.dart';
import 'package:schemas/mutations/generated/Login.graphql.dart';

typedef _TokensRecord = (
  FragmentTokenFragment accessToken,
  FragmentTokenFragment refreshToken,
);

abstract class AuthenticationDataSource {
  Future<_TokensRecord> logInWithUsernameAndPassword({
    required String username,
    required String password,
  });
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  const AuthenticationDataSourceImpl({
    required GQLClient graphlQLClient,
  }) : _client = graphlQLClient;

  final GQLClient _client;

  @override
  Future<_TokensRecord> logInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      final input = InputLoginInput(
        username: username,
        password: password,
      );
      final response = await _client.mutate(
        OptionsMutationLogin(
          variables: VariablesMutationLogin(
            credentials: input,
          ),
        ),
      );

      final data = response.parsedData?.login;

      if (response.hasException) {
        throw response.exception!;
      }
      if (data == null) {
        throw const NoDataException();
      }

      return (data.accessToken, data.refreshToken);
    } catch (e) {
      throw Exception();
    }
  }
}
