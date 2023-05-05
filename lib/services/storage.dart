import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum StorageKeys {
  history("history");

  final String value;

  const StorageKeys(this.value);
}

class Storage {
  SharedPreferences? prefs;

  Storage() {
    SharedPreferences.getInstance()
        .then((prefs) => this.prefs = prefs);
  }

  save(StorageKeys key, dynamic object) async {
    if(prefs == null) {
      throw Exception("Storage not started.");
    }

    prefs!.setString(key.value, jsonEncode(object));
  }

  get(StorageKeys key) async {
    if(prefs == null) {
      return null;
    }

    var valueStored = prefs!.getString(key.value);

    if(valueStored == null) {
      return null;
    }

    return jsonDecode(valueStored);
  }

  remove(StorageKeys key) async {
    if(prefs == null) {
      throw Exception("Storage not started.");
    }

    prefs!.remove(key.value);
  }
}

//refs: https://medium.flutterdevs.com/using-sharedpreferences-in-flutter-251755f07127