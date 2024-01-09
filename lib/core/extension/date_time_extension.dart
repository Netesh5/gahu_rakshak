import 'package:flutter/foundation.dart';

extension DateHourParser on String {
  int getHour() {
    try {
      final parsedDate = DateTime.parse(this);
      return parsedDate.hour;
    } catch (e) {
      // Handle any parsing errors appropriately
      if (kDebugMode) {
        print("Error parsing date: $e");
      }
      return 0;
    }
  }
}
