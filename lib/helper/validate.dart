// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

validate(Map params) {
  for (var key in params.keys) {
    if (params[key].containsKey("validate")) {
      var vl = params[key]['validate'];

      if (vl.containsKey("required") && params[key]["value"].isEmpty) {
        print("Field $key is required");
        return false;
      }

      if (vl.containsKey("min") && vl["min"] > params[key]["value"].length) {
        print("Field $key must be greater than " + vl["min"].toString());
        return false;
      }
    }
  }

  return true;
}
