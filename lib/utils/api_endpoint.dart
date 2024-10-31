class ApiEndPoints {
  static const String baseUrl = 'https://logistic.4gbxsolutions.com/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'auth/register';
  final String loginEmail = 'auth/login';
}
