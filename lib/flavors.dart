enum Flavor {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return '[DEV] ELISOFT';
      case Flavor.STAGING:
        return '[STG] ELISOFT';
      case Flavor.PRODUCTION:
        return 'ELISOFT';
      default:
        return 'title';
    }
  }
}
