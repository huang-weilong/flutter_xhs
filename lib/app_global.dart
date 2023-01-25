class AppGlobal {
  AppGlobal._internal();

  static final AppGlobal _instance = AppGlobal._internal();

  factory AppGlobal() => _instance;
}
