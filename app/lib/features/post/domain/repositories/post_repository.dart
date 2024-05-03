import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts({
    int? first,
    String? after,
  });
}
