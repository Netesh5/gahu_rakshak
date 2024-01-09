import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static locationPermission() async {
    final locationPermission = await Permission.location.status;
    if (locationPermission.isDenied) {
      await Permission.location.request();
    } else if (locationPermission.isPermanentlyDenied) {
      await openAppSettings();
    } else {
      return null;
    }
  }
}
