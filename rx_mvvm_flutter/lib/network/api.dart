class API {
  // 服务器基本地址
  static const BASE_URL = 'http://120.25.226.11:8080/mall-app/wx';
  static const String REGISTER = BASE_URL + '/auth/register'; //注册
  static const String LOGIN = BASE_URL + '/auth/login'; //登录
  static const String LOGIN_OUT = BASE_URL + "/auth/logout"; //退出登录

  static const String ADDRESS_LIST = BASE_URL + '/address/list'; //地址列表
  static const String ADDRESS_SAVE = BASE_URL + '/address/save'; //增加地址
  static const String ADDRESS_DELETE = BASE_URL + '/address/delete'; //删除地址
  static const String ADDRESS_DETAIL = BASE_URL + '/address/detail'; //地址详情
}
