import 'package:shared_preferences/shared_preferences.dart';

//缓存管理类
class HiCache {
  SharedPreferences? prefs;
  HiCache._() {
    init();
  }

  static HiCache? _instance;
  HiCache._pre(SharedPreferences prefs) {
    this.prefs = prefs;
  }

  //预初始化， 防止我们的缓存类还没有初始化，但是已经使用了缓存类。
  static Future<HiCache> preInit() async {
    if(_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = HiCache._pre(prefs);
    }
    return _instance!;
  }

  static HiCache getInstance() {
    if (_instance == null) {
      _instance = HiCache._();
    }
    return _instance!;
  }
  
  void init() async {
    if(prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }
/*
  setString(String key, String value) {
    prefs?.setString(key, value);
  }

  setDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  setBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    prefs?.setStringList(key, value);
  }

  //set方法一个个的定义 get方法使用泛型定义
  T get<T>(String key) { 
    return prefs?.get(key) as T;
  }
*/
//一说，SharedPreferences 是异步缓存，setter方法都是异步的， getter方法 都要用Future.
// Add these improved setter methods to your class
Future<void> setString(String key, String value) async {
  await _ensurePrefsInitialized();
  await prefs!.setString(key, value);
}

Future<void> setDouble(String key, double value) async {
  await _ensurePrefsInitialized();
  await prefs!.setDouble(key, value);
}

Future<void> setInt(String key, int value) async {
  await _ensurePrefsInitialized();
  await prefs!.setInt(key, value);
}

Future<void> setBool(String key, bool value) async {
  await _ensurePrefsInitialized();
  await prefs!.setBool(key, value);
}

Future<void> setStringList(String key, List<String> value) async {
  await _ensurePrefsInitialized();
  await prefs!.setStringList(key, value);
}

// Helper method to ensure prefs is initialized
Future<void> _ensurePrefsInitialized() async {
  if (prefs == null) {
    prefs = await SharedPreferences.getInstance();
  }
}

Future<T?> get<T>(String key) async {
  await _ensurePrefsInitialized();
  return prefs!.get(key) as T;
}

}

//为什么 SharedPreferences 是异步的？
//SharedPreferences 是一个异步的类，因为写入磁盘是一个耗时操作，所以SharedPreferences 的写入操作是异步的。
//防止阻塞UI线程，读写磁盘是一个耗时操作，所以SharedPreferences 的读写操作也是异步的。
//保持跨平台的性能
//符合 Dart async/await 的i/o 操作方法。