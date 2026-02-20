class ApiEndpoints {
  ApiEndpoints._();

  //* Auth
  static const String register = "/auth/register";
  static const String login = "/auth/login";
  static const String me = "/auth/me";

  //* Transaction
  static const String balance = "/transaction/balance";
  static const String transfer = "/transaction/transfer";
  static const String transferHistory = "/transaction/history";
}
