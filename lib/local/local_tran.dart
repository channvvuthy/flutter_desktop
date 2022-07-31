import 'package:flutter_desktop/local/en.dart';
import 'package:flutter_desktop/local/kh.dart';
import 'package:get/get.dart';

class LocalTran extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': en, 'kh_KM': kh};
}
