import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    required this.photoUrl,
    required this.size,
    this.onTap,
    super.key,
  });

  final String? photoUrl;
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final fallbackAvatar = Icon(
      Icons.person,
      size: size,
      color: Colors.white,
    );

    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: photoUrl != null
            ? ClipOval(
                child: CachedNetworkImage(
                  imageUrl: photoUrl!,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => fallbackAvatar,
                ),
              )
            : fallbackAvatar,
      ),
    );
  }
}
