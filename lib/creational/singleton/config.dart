class Config {
  static Config? _instance; // Static instance variable
  Map<String, dynamic> _configurations = {};

  // Private constructor
  Config._();

  // Static method to access the single instance or create it if it doesn't exist
  static Config getInstance() {
    _instance ??= Config._();
    return _instance!;
  }

  // Method to load configuration settings
  void loadConfiguration(String key, dynamic value) {
    _configurations[key] = value;
  }

  // Method to get configuration settings by key
  dynamic getConfiguration(String key) {
    return _configurations[key];
  }
}
