import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.history.tr(),
        centerMiddle: true,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Disease Name ",
              style: appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 20.hp),
            ),
            subtitle: Text(
              "${DateTime.now()}",
              style: appTextTheme.bodyLargeMedium,
            ),
            leading: Hero(
              tag: "historyDetailImage$index",
              child: Image.asset(
                "assets/images/Ghau Rakshak.png",
                height: 100.hp,
                width: 100.hp,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(Routes.historyDetail, arguments: index);
            },
          );
        },
      ),
    );
  }
}
