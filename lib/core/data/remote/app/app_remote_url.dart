class AppRemoteUrl {
  const AppRemoteUrl._();

  static const baseUrl = "http://172.20.10.12:8080/api";

  static const _v1 = "/v1";

  static const _authentication = "/authentication";
  static const _user = "/user";
  static const _type = "/type";
  static const _transaction = "/transaction";
  static const _category = "/category";

  static const login = "$_v1$_authentication/login";
  static const register = "$_v1$_authentication/register";
  static const me = "$_v1$_user/me";
  static const userWallet = "$_v1$_user/wallet";
  static const typeWallet = "$_v1$_type/wallet";
  static const transactionWallet = "$_v1$_transaction/wallet";
  static const transactionCreate = "$_v1$_transaction/create";
  static const categoryList = "$_v1$_category/list";

}