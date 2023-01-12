abstract class KeyStorageService {
  KeyStorageService._internal() {
    // TODO: implement KeyStorageService._internal
    throw UnimplementedError();
  }
  void remove(String key);

  void removeEveryThing();

  dynamic getFromDisk(String key);

  void saveToDisk<T>(String key, T content);

  bool? isNotification;
  String? app_title;
  String? locale;
}
