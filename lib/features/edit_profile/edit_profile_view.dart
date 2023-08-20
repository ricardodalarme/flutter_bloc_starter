import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.editProfile),
      ),
      body: const Center(
        child: Text('EditProfileView'),
      ),
    );
  }
}
