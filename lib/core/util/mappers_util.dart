part of 'util.dart';

/// [MappersUtil] a class holds all mappers function
class MappersUtil {
  /// [mapFailureToMessage] map Failure type with a proper Error message
  static String mapFailureToMessage(Failure failure) {
    if (failure is CatchFailure || failure is ServerFailure) {
      return appLocalizations.internalServerErrorDescription;
    }
    if (failure is NetworkFailure) {
      return appLocalizations.networkErrorDescription;
    }
    if (failure is ClientFailure) {
      return failure.message;
    }
    return appLocalizations.internalServerErrorDescription;
  }

  /// [mapFailureToHeader] map Failure type with a proper popup header
  static String mapFailureToHeader(Failure failure) {
    if (failure is CatchFailure || failure is ServerFailure) {
      return appLocalizations.internalServerError;
    }
    if (failure is NetworkFailure) {
      return appLocalizations.networkError;
    }
    if (failure is ClientFailure) {
      return appLocalizations.somethingWentWrong;
    }
    return appLocalizations.internalServerError;
  }

  /// [mapTimeDifferenceToTimeAgo] to map time difference in a human
  /// friendly way by using `ago` like `2 years ago`
  static String mapTimeDifferenceToTimeAgo(Duration diff) {
    if (diff.inDays > 365) {
      return '${(diff.inDays / 365).floor()} ${appLocalizations.ago('y')}';
    } else if (diff.inDays > 30) {
      return '${(diff.inDays / 30).floor()} ${appLocalizations.ago('m')}';
    } else if (diff.inDays > 7) {
      return '${(diff.inDays / 7).floor()} ${appLocalizations.ago('w')}';
    } else if (diff.inDays > 0) {
      return '${diff.inDays} ${appLocalizations.ago('d')}';
    } else if (diff.inHours > 0) {
      return '${diff.inHours} ${appLocalizations.ago('h')}';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes} ${appLocalizations.ago('min')}';
    } else {
      return appLocalizations.justNow;
    }
  }
}
