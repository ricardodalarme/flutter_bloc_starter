import 'package:common/data/result.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl();

  @override
  Future<Result<List<PostModel>, Exception>> getPosts() async {
    try {
      return const Success([]);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
