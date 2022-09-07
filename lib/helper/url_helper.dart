import 'package:flutter_desktop/models/response/social_response.dart';

class UrlHelper {
  static url(var url) {
    if (url == null) {
      return "https://space.e-schoolcambodia.com/not-found.jpg";
    }
    if (url.startsWith("http")) {
      return url;
    }
    return "https://space.e-schoolcambodia.com/$url";
  }

  static arrUrl(var arr) {
    if (arr is List) {
      if (arr.isNotEmpty) {
        return arr[0].url;
      }
    }
    return "https://e-schoolcambodia.com/assets/web_assets/img/logo-green.png";
  }

  static imgUrl(var arr, index) {
    String defaultUrl =
        "https://e-schoolcambodia.com/assets/web_assets/img/logo-green.png";

    try {
      if (arr is List) {
        if (arr.isNotEmpty) {
          return arr[index].url;
        }
      }
      return defaultUrl;
    } catch (e) {
      return defaultUrl;
    }
  }
}
