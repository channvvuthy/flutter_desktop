class NullHelper {
  static nullString(var text) {
    if (text == null) {
      return "";
    }
    return text;
  }

  static nullArray(var arr) {
    if (arr is List) {
      if (arr.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
