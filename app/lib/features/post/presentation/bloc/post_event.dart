part of 'post_bloc.dart';

sealed class PostEvent {
  const PostEvent();
}

final class PostFetched extends PostEvent {
  const PostFetched();
}
