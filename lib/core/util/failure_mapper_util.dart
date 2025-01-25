part of 'util.dart';

/// [FailureMapper] a class to map Failures
class FailureMapper {
  const FailureMapper._();

  /// [mapFailureToMessage] map Failure type with a proper Error message
  static String mapFailureToMessage(Failure failure) {
    if (failure is CatchFailure || failure is ServerFailure) {
      return appLocalizations.internalServerErrorDescription;
    }
    if (failure is NetworkFailure) {
      return 'Please check your connection';
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
      return "You're offline";
    }
    if (failure is ClientFailure) {
      return failure.message;
    }
    return appLocalizations.internalServerError;
  }
}
