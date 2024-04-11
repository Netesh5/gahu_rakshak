import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/images/custom_network_image.dart';
import 'package:gahurakshak/core/injector/injector.dart';

import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/core/services/result_service.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/history/data/repository/fetch_result_detail.dart';
import 'package:gahurakshak/features/history/presentation/widgets/no_data_widget.dart';
import 'package:gahurakshak/features/result/data/models/result_model.dart';

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
      body: StreamBuilder(
        stream: FetchResultDetail(userToken: DI.instance()).fetchResultDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> data = snapshot.data!.docs;
              List<ResultModel> item = data
                  .map(
                    (e) => ResultModel(
                      diseaseName: e["diseaseName"],
                      dateTime: DateFormat("dd-MM-yyyy").format(
                        DateTime.fromMillisecondsSinceEpoch(
                          int.parse(
                            e["dateTime"],
                          ),
                        ),
                      ),
                      imagePath: e["imagePath"],
                      confidence: e["confidence"] ?? "",
                    ),
                  )
                  .toList();
              return ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    horizontalTitleGap: 20.wp,
                    title: Text(
                      item[index].diseaseName,
                      style: appTextTheme.bodyLargeSemiBold
                          .copyWith(fontSize: 20.hp),
                    ),
                    subtitle: Text(
                      item[index].dateTime,
                      style: appTextTheme.bodyLargeMedium,
                    ),
                    leading: Hero(
                      tag: "historyDetailImage$index",
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CustomCachedNetworkImage(
                          fit: BoxFit.cover,
                          url: item[index].imagePath,
                          height: 100.hp,
                          width: 100.wp,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.historyDetail,
                          arguments: showResultInHistory(
                            item[index].diseaseName,
                            item[index].dateTime,
                            item[index].imagePath,
                            index,
                            item[index].confidence,
                          ));
                    },
                  );
                },
              );
            } else {
              return const NoDataWidget();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            const NoDataWidget();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return const NoDataWidget();
          }
          return const NoDataWidget();
        },
      ),
    );
  }
}
