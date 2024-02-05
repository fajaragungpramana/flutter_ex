class AppRemoteUrl {
  const AppRemoteUrl._();

  static const baseUrl = "http://10.0.2.2:8080/api";

  static const _v1 = "/v1";

  static const _authentication = "/authentication";
  static const _user = "/user";

  static const login = "$_v1$_authentication/login";
  static const register = "$_v1$_authentication/register";
  static const me = "$_v1$_user/me";

}