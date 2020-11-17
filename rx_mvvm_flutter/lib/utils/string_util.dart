import 'dart:convert';

class StringUtils {
  // 字符串编码
  static String encode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }

  // 字符串解码
  static String decode(String encodeCn) {
    var list = List<int>();
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }

  static isEmpty(String str) {
    return str == null || str.isEmpty || str.length == 0;
  }
}
