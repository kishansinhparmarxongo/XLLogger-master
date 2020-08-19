import 'dart:convert';

import 'package:XLLogger/package/log_print.dart';
import 'package:XLLogger/package/xllogger.dart';

class SimplePrinter extends LogPrinter {
  /// Outputs simple log messages:
  /// ```
  /// log name [E] Log message  ERROR: Error info
  /// ```
  static final levelPrefixes = {
    XLLevel.verbose: '[V]',
    XLLevel.debug: '[D]',
    XLLevel.info: '[I]',
    XLLevel.warning: '[W]',
    XLLevel.error: '[E]',
    XLLevel.wtf: '[WTF]',
  };

  @override
  List<String> log(LogEvent event) {
    // TODO: implement log
    var logNameStr = "${event.logName}";
    var messageStr = _stringifyMessage(event.message);
    var errorStr = event.error != null ? '  ERROR: ${event.error}' : '';
    var timeStr = 'TIME: ${DateTime.now().toIso8601String()}';
    return [
      '$logNameStr${ levelPrefixes[event.level]} $timeStr $messageStr$errorStr'
    ];
  }

  String _stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      var encoder = JsonEncoder.withIndent(null);
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }
}
