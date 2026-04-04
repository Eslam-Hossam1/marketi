import 'package:flutter/material.dart';
import 'package:marketi/features/edit_profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EditProfileViewBody(),
      ),
    );
  }
}

