import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({
    required PostRepository postRepository,
  })  : _postRepository = postRepository,
        super(const PostState()) {
    on<PostFetched>(_onPostFetched);
  }

  final PostRepository _postRepository;

  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    emit(state.copyWith(status: PostStatus.loading));

    final result = await _postRepository.getPosts();
    final newState = switch (result) {
      Success(value: final posts) => state.copyWith(
          status: PostStatus.success,
          posts: posts,
        ),
      Failure() => state.copyWith(
          status: PostStatus.failure,
        ),
    };

    emit(newState);
  }
}
