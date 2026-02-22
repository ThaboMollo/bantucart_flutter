enum AppEnv { dev, staging, prod }

extension AppEnvX on AppEnv {
  static AppEnv fromString(String value) {
    switch (value.toLowerCase()) {
      case 'prod':
      case 'production':
        return AppEnv.prod;
      case 'staging':
        return AppEnv.staging;
      case 'dev':
      default:
        return AppEnv.dev;
    }
  }

  String get name {
    switch (this) {
      case AppEnv.dev:
        return 'dev';
      case AppEnv.staging:
        return 'staging';
      case AppEnv.prod:
        return 'prod';
    }
  }
}
