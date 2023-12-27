import 'package:common/data/gql_client.dart';
import 'package:graphql/client.dart';
import 'package:schemas/generated/schema.graphql.dart';
import 'package:schemas/mutations/generated/UpdateUser.graphql.dart';

abstract class EditProfileDataSource {
  Future<void> updateUser({
    required String? email,
    required String? firstName,
    required String? lastName,
  });
}

class EditProfileDataSourceImpl implements EditProfileDataSource {
  const EditProfileDataSourceImpl({
    required GQLClient graphlQLClient,
  }) : _client = graphlQLClient;

  final GQLClient _client;

  @override
  Future<void> updateUser({
    required String? email,
    required String? firstName,
    required String? lastName,
  }) async {
    try {
      final input = InputUpdateUserInput(
        email: email,
        firstName: firstName,
        lastName: lastName,
      );
      final response = await _client.mutate(
        OptionsMutationUpdateUser(
          variables: VariablesMutationUpdateUser(input: input),
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
