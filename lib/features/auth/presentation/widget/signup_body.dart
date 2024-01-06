import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/form_validator.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_outline_button.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_round_button.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_text_fields.dart';
import 'package:gahurakshak/features/auth/data/models/register_new_account_param.dart';
import 'package:gahurakshak/features/auth/data/respository/auth_repo.dart';
import 'package:provider/provider.dart';

class SignupBody extends StatelessWidget {
  SignupBody({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.signup.tr(),
        showShadow: true,
      ),
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.hp),
                  child: Text(
                    LocaleKeys.registerNewAccount.tr(),
                    style:
                        appTextTheme.bodyLargeMedium.copyWith(fontSize: 25.hp),
                  ),
                ),
                SizedBox(
                  height: 20.hp,
                ),
                CustomTextField(
                  controller: fullNameController,
                  label: LocaleKeys.fullName.tr(),
                  hintText: LocaleKeys.enterFullName.tr(),
                  textInputType: TextInputType.name,
                  isRequired: true,
                  validator: (value) {
                    return FormValidator.validateFieldNotEmpty(
                        value, LocaleKeys.fullName);
                  },
                ),
                CustomTextField(
                  controller: emailController,
                  label: LocaleKeys.email.tr(),
                  hintText: LocaleKeys.enterEmail.tr(),
                  textInputType: TextInputType.emailAddress,
                  isRequired: true,
                  validator: (value) {
                    return FormValidator.validateEmail(value);
                  },
                ),
                CustomTextField(
                  controller: passwordController,
                  label: LocaleKeys.password.tr(),
                  hintText: LocaleKeys.enterPassword.tr(),
                  isPassword: true,
                  isRequired: true,
                  obscureText: true,
                  validator: (value) {
                    return FormValidator.validatePassword(value);
                  },
                ),
                CustomTextField(
                  controller: phoneNumberController,
                  label: LocaleKeys.phoneNumber.tr(),
                  hintText: LocaleKeys.enterPhoneNumber.tr(),
                  textInputType: TextInputType.phone,
                  maxLength: 10,
                  isRequired: true,
                  validator: (value) {
                    return FormValidator.validateMobileNumber(value);
                  },
                ),
                SizedBox(
                  height: 20.hp,
                ),
                CustomRoundedButtom(
                  horizontalMargin: 20.hp,
                  title: LocaleKeys.signup.tr(),
                  color: AppColors.goldenColor,
                  textColor: AppColors.black,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthRepo>().registerNewAccount(
                            context,
                            RegisterNewAccountParam(
                              fullname: fullNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phoneNo: phoneNumberController.text,
                            ),
                          );
                    }
                  },
                ),
                SizedBox(
                  height: 50.hp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hp),
                  child: Row(
                    children: [
                      const Expanded(child: Divider()),
                      SizedBox(
                        width: 10.wp,
                      ),
                      Text(
                        LocaleKeys.or.tr(),
                        style: appTextTheme.bodyNormalBold,
                      ),
                      SizedBox(
                        width: 10.wp,
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.hp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.wp),
                  child: CustomOutlineButton(
                    title: LocaleKeys.singupWithGoogle.tr(),
                    onPressed: () {},
                    leftIcon: FontAwesomeIcons.google,
                  ),
                ),
                SizedBox(
                  height: 50.hp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
