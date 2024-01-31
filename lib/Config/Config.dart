class Config {
  static final Config _ins = Config(weatherKey: "CWA-DD3776C7-1275-4C4A-BC63-C9CA8F50826F");

  Config({this.weatherKey = ''});

  static Config get ins => _ins;

  String weatherKey;
}
