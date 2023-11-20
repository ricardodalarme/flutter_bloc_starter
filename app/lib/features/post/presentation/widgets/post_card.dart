import 'package:common_ui/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';

const _profilePictureSize = 40.0;
const _bodyMaxLines = 7;

class PostCard extends StatelessWidget {
  const PostCard({
    required this.post,
    super.key,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
        leading: const ProfilePicture(
          photoUrl: null,
          size: _profilePictureSize,
        ),
        isThreeLine: true,
        title: Text(
          post.title,
          style: textTheme.titleLarge,
        ),
        subtitle: Text(
          post.body,
          maxLines: _bodyMaxLines,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
