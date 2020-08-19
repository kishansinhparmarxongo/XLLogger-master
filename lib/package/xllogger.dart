import 'package:XLLogger/package/output/console_output.dart';
import 'package:XLLogger/package/printer/simple_printer.dart';

import 'XLEvent.dart';
import 'log_output.dart';
import 'log_print.dart';

enum XLLevel {
  verbose,
  debug,
  info,
  warning,
  error,
  wtf,
  nothing,
}

final levelLabel = {
  XLLevel.verbose: 'verbose ',
  XLLevel.debug: 'debug ',
  XLLevel.info: 'info ',
  XLLevel.warning: 'warning ',
  XLLevel.error: 'error ',
  XLLevel.wtf: 'wtf ',
};

class OutputEvent {
  final XLLevel level;
  final XLPriority priority;
  final List<String> lines;

  OutputEvent(this.level, this.priority, this.lines);
}

class LogEvent {
  final XLLevel level;
  final XLPriority priority;
  final dynamic logName;
  final dynamic message;
  final dynamic error;
  final StackTrace stackTrace;

  LogEvent(this.level, this.priority,this.logName, this.message, this.error, this.stackTrace);
}

class XLLogger {
  static XLLevel _level = XLLevel.verbose;
  final LogPrinter _printer;
  final LogOutput _output;
  final String _logName;
  static XLPriority _priority = XLPriority.medium;

  XLLogger(
      {XLLevel level,
      String logName,
      LogPrinter printer,
      XLPriority priority,
      LogOutput output})
      : _printer = printer ?? SimplePrinter(),
        _output = output ?? ConsoleOutput(),
        _logName = logName ?? 'XLLogger' {
    _level = level ?? XLLevel.verbose;
    _priority = priority ?? XLPriority.medium;
  }

  static server(String logString) {
    print("$logString");
  }

  /// Log a message at level [XLLevel.verbose].
  void printLog(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(_level, message, error, stackTrace);
  }

  /// Log a message at level [XLLevel.verbose].
  void v(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(XLLevel.verbose, message, error, stackTrace);
  }

  /// Log a message at level [XLLevel.debug].
  void d(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(XLLevel.debug, message, error, stackTrace);
  }

  /// Log a message at level [XLLevel.info].
  void i(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(XLLevel.info, message, error, stackTrace);
  }

  /// Log a message at level [XLLevel.warning].
  void w(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(XLLevel.warning, message, error, stackTrace);
  }

  /// Log a message at level [XLLevel.error].
  void e(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(XLLevel.error, message, error, stackTrace);
  }

  /// Log a message with [level].
  void log(XLLevel level, dynamic message,
      [dynamic error, StackTrace stackTrace]) {
    if (error != null && error is StackTrace) {
      throw ArgumentError('Error parameter cannot take a StackTrace!');
    } else if (level == XLLevel.nothing) {
      throw ArgumentError('Log events cannot have Level.nothing');
    }
    var logEvent = LogEvent(level, _priority,_logName, message, error, stackTrace);
    var output = _printer.log(logEvent);
    var outputEvent = OutputEvent(level, _priority, output);
    _output.output(outputEvent);
  }
}
