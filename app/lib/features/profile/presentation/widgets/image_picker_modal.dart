import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/features/profile/presentation/widgets/circle_icon_button.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class ImagePickerModal extends StatelessWidget {
  const ImagePickerModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSpacing.xxlarge,
          bottom: AppSpacing.large,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleIconButton(
                  label: context.l10n.profile.buttonPickImageFromCamera,
                  icon: Icons.camera_alt,
                  onTap: () => context.maybePop(),
                ),
                const Gap(AppSpacing.medium),
                CircleIconButton(
                  label: context.l10n.profile.buttonPickImageFromGallery,
                  icon: Icons.photo_library,
                  onTap: () => context.maybePop(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
