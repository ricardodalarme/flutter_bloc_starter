import 'package:common/common.dart';
import 'package:graphql/client.dart';
import 'package:schemas/generated/schema.graphql.dart';
import 'package:schemas/mutations/generated/Login.graphql.dart';

abstract class AuthenticationDataSource {
  Future<void> logInWithUsernameAndPassword({
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
  Future<void> logInWithUsernameAndPassword({
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

      if (response.hasException) {
        throw response.exception!;
      }
    } catch (e) {
      throw const ServerException();
    }
  }
}
