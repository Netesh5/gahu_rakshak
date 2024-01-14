import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/models/user_model.dart';
import 'package:gahurakshak/core/shared_prefrences/user_shared_prefrences.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
    required this.userToken,
  });
  final UserToken userToken;
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final controller = TextEditingController();
  UserModel? userModel;
  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    userModel = await widget.userToken.fetchUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.profile.tr(),
        centerMiddle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.wp),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35.wp,
                    backgroundImage: userModel?.photoUrl != null
                        ? NetworkImage(
                            userModel?.photoUrl ?? "",
                          )
                        : const AssetImage("assets/images/Ghau Rakshak.png")
                            as ImageProvider,
                    onBackgroundImageError: (exception, stackTrace) {
                      debugPrint(exception.toString());
                    },
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        userModel?.displayName ?? "",
                        style: appTextTheme.bodyLargeSemiBold
                            .copyWith(fontSize: 22.wp),
                      ),
                      subtitle: Text(
                        userModel?.email ?? "",
                        style: appTextTheme.bodyLargeRegular,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.hp,
              ),
              Divider(
                color: AppColors.grey.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
