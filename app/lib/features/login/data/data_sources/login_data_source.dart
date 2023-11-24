import 'package:common/data/gql_client.dart';
import 'package:common/schemas/generated/schema.graphql.dart';
import 'package:common/schemas/mutations/generated/Login.graphql.dart';
import 'package:graphql/client.dart';

abstract class LoginDataSource {
  Future<void> logInWithUsernameAndPassword({
    required String username,
    required String password,
  });
}

class LoginDataSourceImpl implements LoginDataSource {
  const LoginDataSourceImpl({
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
