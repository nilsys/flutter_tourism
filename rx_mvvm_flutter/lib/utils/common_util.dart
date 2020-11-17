class CommonUtil {
  // 密码正则匹配
  static isPassword(String password) {
    return new RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$')
        .hasMatch(password);
  }

  // 邮箱正则匹配
  static isEmail(String email) {
    return new RegExp(r'^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$').hasMatch(email);
  }
}
