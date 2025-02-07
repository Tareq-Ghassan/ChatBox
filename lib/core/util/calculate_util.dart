part of 'util.dart';

/// [CalculateUtil] a utility class for any calculations a cross the app
class CalculateUtil {
  /// [timeDifference] calculate time difference between 
  /// `DateTime.now()` and the passed [date]
  static Duration timeDifference(DateTime date) {
    return DateTime.now().difference(date);
  }
}
