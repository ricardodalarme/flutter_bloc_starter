part of 'post_bloc.dart';

enum PostStatus {
  loading,
  success,
  failure,
}

final class PostState with EquatableMixin {
  const PostState({
    this.status = PostStatus.loading,
    this.posts = const <PostModel>[],
  });

  final PostStatus status;
  final List<PostModel> posts;

  PostState copyWith({
    PostStatus? status,
    List<PostModel>? posts,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object?> get props => [status, posts];
}
