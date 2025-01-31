part of 'util.dart';

/// [FailureMapper] a class to map Failures
class FailureMapper {
  /// [FailureMapper] constructor
  const FailureMapper();

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
}
