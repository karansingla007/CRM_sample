import 'package:flutter_assignment/constants/strings.dart';

class Util {
  static bool isStringNotNull(str) {
    if (str is String && str != null) {
      str = str.trim();
      if (str.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  static bool isValidList(List? list) {
    if (list != null && list.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static String getCurrentUser() {
    return Strings.memberIdList.first;
  }

  static List<String> csvToList(String csv) {
    if (csv.endsWith(",")) {
      csv = csv.substring(0, csv.length - 1);
    }
    List<String> list = csv.split(",");
    return list;
  }

  static String getInitialFromFullName({required String fullName}) {
    return (fullName.split(" ").first[0] + fullName.split(" ")[1][0])
        .toUpperCase();
  }
}
