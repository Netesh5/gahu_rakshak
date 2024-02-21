import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/dashboard/presenatation/data/models/ml_data_models.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DashBoardBody extends StatelessWidget {
  DashBoardBody({super.key});

  final List<Map<String, String>> modelDetailList = [
    {
      "title": "Model 1",
    },
    {
      "title": "Model 2",
    },
    {
      "title": "Model 3",
    },
    {
      "title": "Model 4",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.dashBoard.tr(),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.wp),
        child: GridView.builder(
          itemCount: modelDetailList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.modelDetail,
                  arguments: MLDataModel(
                    title: "Model 1",
                    modelData: [],
                  ),
                );
              },
              child: Card(
                color: AppColors.grey.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        LucideIcons.scatterChart,
                        color: AppColors.goldenColor,
                        size: 70,
                      ),
                      SizedBox(
                        height: 40.hp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            modelDetailList[index]["title"] ?? "",
                            style: appTextTheme.bodyLargeSemiBold
                                .copyWith(fontSize: 20.wp),
                          ),
                          const Icon(
                            LucideIcons.chevronRight,
                            color: AppColors.goldenColor,
                            size: 26,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
