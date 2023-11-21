import 'package:common/data/result.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';

abstract class PostRepository {
  Future<Result<List<PostModel>, Exception>> getPosts();
}
