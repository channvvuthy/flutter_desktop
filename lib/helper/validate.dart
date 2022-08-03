// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter_desktop/constant/color.dart';
import 'package:get/get.dart';

bool validate(Map params) {
  for (var key in params.keys) {
    if (params[key].containsKey("validate")) {
      var vl = params[key]['validate'];

      if ((vl.containsKey("required") && params[key]["value"].isEmpty)) {
        validateDialog("Field $key is required");
        return false;
      }

      if (vl.containsKey("min") && vl["min"] > params[key]["value"].length) {
        validateDialog(
            "Field $key must be greater than " + vl["min"].toString());
        return false;
      }

      if (vl.containsKey("max") && vl["max"] < params[key]["value"].length) {
        validateDialog(
            "Field $key.replaceAll(find, replaceWith); must be less than " +
                vl["min"].toString());
        return false;
      }

      if (vl.containsKey("phone")) {
        String regexPattern = r'^(?:[+0][1-9])?[0-9]{9,12}$';
        var regExp = RegExp(regexPattern);

        if (regExp.hasMatch(params[key]["value"]) == false) {
          validateDialog("Invalid phone number");
          return false;
        }
      }

      if (vl.containsKey("confirm_password")) {
        if (params["confirm_password"]["value"] !=
            params["password"]["value"]) {
          validateDialog("Confirm password not match with password");
          return false;
        }
      }

      if (vl.containsKey("email")) {
        String regexPattern =
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        var regExp = RegExp(regexPattern);

        if (regExp.hasMatch(params[key]["value"]) == false) {
          validateDialog("Invalid email address");
          return false;
        }
      }
    }
  }

  return true;
}

validateDialog(String middleText) {
  Get.defaultDialog(
      title: "Error",
      middleText: middleText,
      radius: 16,
      textConfirm: "Ok",
      onConfirm: () {
        Get.back();
      },
      buttonColor: PRIMARY_COLOR);
}
