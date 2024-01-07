import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/form_validator.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_round_button.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_text_fields.dart';
import 'package:gahurakshak/features/auth/data/models/forget_password_param.dart';
import 'package:gahurakshak/features/auth/data/respository/auth_repo.dart';
import 'package:provider/provider.dart';

class ForgetPasswordBody extends StatelessWidget {
  ForgetPasswordBody({super.key});
  final _emailController = TextEditingController();
  final _formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.forgetPassword.tr(),
        showShadow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.hp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.hp,
            ),
            Text(
              LocaleKeys.pleaseEnterYourEmailAddressToReceiveMail.tr(),
              style: appTextTheme.bodyLargeSemiBold,
            ),
            SizedBox(
              height: 20.hp,
            ),
            FormBuilder(
              key: _formkey,
              child: CustomTextField(
                controller: _emailController,
                rightPadding: 0,
                leftPadding: 0,
                label: LocaleKeys.email.tr(),
                hintText: LocaleKeys.enterEmail.tr(),
                isRequired: true,
                validator: (value) {
                  return FormValidator.validateEmail(value);
                },
              ),
            ),
            SizedBox(
              height: 40.hp,
            ),
            CustomRoundedButtom(
              color: AppColors.goldenColor,
              title: LocaleKeys.requestResetLink.tr(),
              textColor: AppColors.black,
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  context.read<AuthRepo>().resetPassword(
                        context,
                        ForgetPasswordParam(
                          email: _emailController.text,
                        ),
                      );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
