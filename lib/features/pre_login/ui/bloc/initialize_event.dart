// ignore_for_file: public_member_api_docs

part of 'initialize_bloc.dart';

/// [InitializeEvent] is a sealed class
sealed class InitializeEvent extends Equatable {
  const InitializeEvent();

  @override
  List<Object> get props => [];
}

/// [InitializeApp] event, which triggers the app initialization with
/// credentials.
class InitializeApp extends InitializeEvent {
  /// [InitializeApp] constructor
  const InitializeApp({
    required this.appKey,
    required this.appSecret,
  });
  final String appKey;
  final String appSecret;
  @override
  List<Object> get props => [appKey, appSecret];
}
