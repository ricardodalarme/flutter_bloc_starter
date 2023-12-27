import 'package:common/data/gql_client.dart';
import 'package:graphql/client.dart';
import 'package:schemas/queries/generated/GetPosts.graphql.dart';

abstract class PostDataSource {
  Future<QueryGetPostsposts> getPosts();
}

class PostDataSourceImpl implements PostDataSource {
  PostDataSourceImpl({
    required GQLClient graphlQLClient,
  }) : _client = graphlQLClient;

  final GQLClient _client;

  @override
  Future<QueryGetPostsposts> getPosts() async {
    try {
      final response = await _client.query(
        OptionsQueryGetPosts(),
      );
      final data = response.parsedData?.posts;

      if (data == null) {
        throw const ServerException();
      }
      return data;
    } catch (e) {
      throw const ServerException();
    }
  }
}
