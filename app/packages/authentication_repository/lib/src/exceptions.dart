class AuthenticationException implements Exception {}

class SignUpWithEmailAndPasswordException extends AuthenticationException {}

class LogInWithEmailAndPasswordException extends AuthenticationException {}

class LogInWithGoogleException extends AuthenticationException {}

class LogInWithFacebookException extends AuthenticationException {}

class LogOutException extends AuthenticationException {}
