export 'toast_util.dart';
export 'string_util.dart';
export 'system_utils.dart';
export 'sp_utils.dart';
export 'shared_preferences_util.dart';
export 'file_utils.dart';
export 'common_util.dart';

/// 检查对象或 List 或 Map 是否为空
bool isObjectEmpty(Object object) {
  if (object == null) return true;
  if (object is String && object.isEmpty) {
    return true;
  } else if (object is List && object.isEmpty) {
    return true;
  } else if (object is Map && object.isEmpty) {
    return true;
  }
  return false;
}
