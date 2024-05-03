import 'package:quickstart_flutter_bloc/features/post/data/data_sources/post_data_source.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/repositories/post_repository.dart';
import 'package:schemas/queries/generated/GetPosts.graphql.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({
    required PostDataSource postDataSource,
  }) : _postDataSource = postDataSource;

  final PostDataSource _postDataSource;

  @override
  Future<List<PostModel>> getPosts({
    int? first,
    String? after,
  }) async {
    final result = await _postDataSource.getPosts(
      first: first,
      after: after,
    );
    final parsedResult = result.nodes
        .whereType<QueryGetPostspostsnodesPost>()
        .map(
          (element) => PostModel(
            id: element.id,
            title: element.title,
            body: element.body,
            authorImageUrl: element.createdBy.profilePicture?.url,
          ),
        )
        .toList();

    return parsedResult;
  }
}
