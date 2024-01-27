import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({
    this.onImageSelected,
    super.key,
  });

  final void Function(XFile?)? onImageSelected;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.medium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Image',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.medium),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                final picker = ImagePicker();
                final image =
                    await picker.pickImage(source: ImageSource.camera);
                onImageSelected?.call(image);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () async {
                final picker = ImagePicker();
                final image =
                    await picker.pickImage(source: ImageSource.gallery);
                onImageSelected?.call(image);
              },
            ),
          ],
        ),
      ),
    );
  }
}
