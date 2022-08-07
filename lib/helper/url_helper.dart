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
}
