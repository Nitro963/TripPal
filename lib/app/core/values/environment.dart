abstract class Environment {
  static const API_URL =
      String.fromEnvironment('API_URL', defaultValue: 'api.untitled.com');

  static const APP_TITLE =
      String.fromEnvironment('APP_TITLE', defaultValue: 'Untitled');

  static const APP_ID =
      String.fromEnvironment('APP_ID', defaultValue: 'com.untitled.app');
}
