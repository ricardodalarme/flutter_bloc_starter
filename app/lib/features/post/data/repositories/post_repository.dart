import 'package:common/data/result.dart';
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
  Future<Result<List<PostModel>, Exception>> getPosts() async {
    try {
      final result = await _postDataSource.getPosts();
      final parsedResult = result.nodes
          .whereType<QueryGetPostspostsnodesPost>()
          .map(
            (element) => PostModel(
              id: element.id,
              title: element.title,
              body: element.body,
            ),
          )
          .toList();

      return Success(parsedResult);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
