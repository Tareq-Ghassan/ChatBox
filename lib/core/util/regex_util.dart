part of 'util.dart';

/// [Regex] a singleton that holds app regex
class Regex {
  const Regex._();

  ///[email]
  static final email = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  ///[password]
  static final password = RegExp('.{6,}');

  ///[phoneNumber]
  static final phoneNumber = RegExp(r'^\d{4,15}$');
}
