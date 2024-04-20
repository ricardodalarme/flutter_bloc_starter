import 'package:common_data/common_data.dart';
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
        throw Exception();
      }
      return data;
    } catch (e) {
      throw Exception();
    }
  }
}
