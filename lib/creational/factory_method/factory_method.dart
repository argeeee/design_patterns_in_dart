abstract class Logger {
  void log(String message);
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print('Logging to console: $message');
  }
}

class FileLogger implements Logger {
  @override
  void log(String message) {
    print('Logging to file: $message');
  }
}

class NoLogger implements Logger {
  @override
  void log(String message) {
    // Do nothing
  }
}

enum LoggingProvider {
  console,
  file,
  noLogging, // New option
}

class LoggerFactory {
  Logger createLogger(LoggingProvider provider) {
    switch (provider) {
      case LoggingProvider.console:
        return ConsoleLogger();
      case LoggingProvider.file:
        return FileLogger();
      case LoggingProvider.noLogging:
        return NoLogger(); // Return NoLogger for no logging option
      default:
        throw Exception('Invalid logging provider');
    }
  }
}
