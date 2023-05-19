import 'package:shared_preferences/shared_preferences.dart';
import '../../model/todo_model.dart';

class SharedHelper {
  static late SharedPreferences sharedPref;

  static init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> saveListToShared(
      {required String key, required List<TodoModel> values}) async {
    var stringList = <String>[];
    for (var item in values) {
      stringList.add(item.toJson());
    }
    return await sharedPref.setStringList(key, stringList);
  }

  static Iterable<TodoModel> getListFromShared({required String key}) sync* {
    if (sharedPref.containsKey(key)) {
      List<String>? stringList = sharedPref.getStringList(key);
      for (String item in stringList!) {
        yield TodoModel.fromJson(item);
      }
    }
  }
}
