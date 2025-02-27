

import 'package:get_storage/get_storage.dart';

class TLocalStorage{
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage(){
    return _instance;
  }

  TLocalStorage._internal();

  final _storage = GetStorage();

  // Generic Method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);

  }

  // Generic Method to Read data
  T? readData<T>(String key){
    return _storage.read<T>(key);
  }

  // Generic Method to remove data
  Future<void> removeData<T>(String key) async {
    await _storage.remove(key);

  }

  // Generic Method to Clear All data
  Future<void> clearAll<T>(String key) async {
    await _storage.erase();

  }

}