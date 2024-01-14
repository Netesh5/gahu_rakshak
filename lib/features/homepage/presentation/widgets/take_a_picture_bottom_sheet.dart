import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/bottom_sheets/custom_bottom_sheet_wrapper.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/services/image_picker_services.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

showTakeAPictureBottomSheet(
  BuildContext context,
  ImagePickerService imagePickerService,
) {
  showModalBottomSheet(
    backgroundColor: AppColors.backgroundColor,
    context: context,
    isScrollControlled: true,
    builder: (context) => ChangeNotifierProvider.value(
      value: imagePickerService,
      child: const TakeAPictureBottomSheet(),
    ),
  );
}

class TakeAPictureBottomSheet extends StatelessWidget {
  const TakeAPictureBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return BottomSheetWrapper(
        title: LocaleKeys.chooseAOption.tr(),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                LucideIcons.image,
                color: AppColors.goldenColor,
              ),
              title: Text(
                LocaleKeys.chooseFromGallery.tr(),
                style: appTextTheme.bodyLargeSemiBold,
              ),
              onTap: () {
                context.read<ImagePickerService>().pickFromGallery(context);
                // showLoadingDialog(context, true);
                // if (context.read<ImagePickerService>().file != null) {
                //   //  showLoadingDialog(context, false);
                //   Navigator.pushNamed(
                //     context,
                //     Routes.result,
                //   );
                // }
              },
            ),
            ListTile(
              leading: const Icon(
                LucideIcons.camera,
                color: AppColors.goldenColor,
              ),
              title: Text(
                LocaleKeys.takeAPicture.tr(),
                style: appTextTheme.bodyLargeSemiBold,
              ),
              onTap: () async {
                await context
                    .read<ImagePickerService>()
                    .takeImageFromCamera(context);
              },
            ),
            SizedBox(
              height: 40.hp,
            )
          ],
        ));
  }
}
