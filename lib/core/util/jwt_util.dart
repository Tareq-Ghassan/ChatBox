part of 'util.dart';

/// [JWTUtil]
class JWTUtil {
  /// [validateJWT] function checks if a JWT is well-formed and not expired.
  static bool validateJWT({
    required String token,
  }) {
    try {
      //# Split the token into its three parts (Header, Payload, Signature)
      final parts = token.split('.');
      if (parts.length != 3) {
        return false; // Malformed token
      }

      //# Decode payload (Base64Url decoding)
      final payload = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
      ) as Map<String, dynamic>;

      //? Ensure the payload contains an expiration (exp) claim
      if (payload['exp'] == null || payload['exp'] is! int) {
        return false;
      }

      //? Check if the token has expired
      final expiration =
          DateTime.fromMillisecondsSinceEpoch((payload['exp'] as int) * 1000);
      if (DateTime.now().isAfter(expiration)) {
        //! Token expired
        return false;
      }

      //# Extract user ID from token
      final tokenUserId =
          payload.containsKey('id') ? payload['id'] as String? : null;

      //? Ensure token contains a user ID
      if (tokenUserId == null) {
        //! Invalid user
        return false;
      }

      //* Token is valid
      return true;
    } catch (e) {
      //! Invalid token format or decoding error
      return false;
    }
  }
}
