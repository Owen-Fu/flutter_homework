class Config {
  static final Config _ins = Config(weatherKey: "");

  Config({this.weatherKey = ''});

  static Config get ins => _ins;

  String weatherKey;
}
