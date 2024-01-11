import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_round_button.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_text_fields.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomTextField(
              label: "Full name",
              hintText: "Full Name",
              controller: controller,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomRoundedButtom(
              title: "Send data",
              textColor: AppColors.black,
              onPressed: () {
                debugPrint(controller.text);
                // ProfileRepo().saveUserInfo(name: controller.text);
              },
              color: AppColors.goldenColor,
            )
          ],
        ),
      ),
    );
  }
}
