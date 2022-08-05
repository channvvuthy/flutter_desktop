class UrlHelper {
  static url(String url) {
    if (url.startsWith("http")) {
      return url;
    }
    return "https://space.e-schoolcambodia.com/$url";
  }
}
