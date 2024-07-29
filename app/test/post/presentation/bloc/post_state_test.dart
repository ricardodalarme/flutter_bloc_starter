import 'package:common/common.dart';
import 'package:flutter_bloc_starter/features/post/domain/models/post_model.dart';
import 'package:flutter_bloc_starter/features/post/presentation/bloc/post_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const posts = [
    PostModel(
      id: '1',
      title: 'title',
      body: 'body',
    ),
  ];

  group('PostState', () {
    test('returns same object when no properties are passed', () {
      expect(const PostState().copyWith(), const PostState());
    });

    test('returns object with updated posts when posts is passed', () {
      expect(
        const PostState().copyWith(posts: const Success(posts)),
        const PostState(posts: Success(posts)),
      );
    });
  });
}
