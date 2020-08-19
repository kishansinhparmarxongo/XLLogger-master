import 'dart:convert';

import 'package:XLLogger/package/log_print.dart';
import 'package:XLLogger/package/xllogger.dart';

class BeautifulPrinter extends LogPrinter {
  /// Outputs Beautiful log messages:
  /// =================================
  /// log name [E] Log message  ERROR: Error info
  /// =================================
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
    List<String> list = [
      '============= START ${event.logName} ${levelPrefixes[event.level]} ${event.priority} =================',
      '----------------------------------',
    ];
    var messageStr = "MESSAGE: " + _stringifyMessage(event.message);
    var errorStr = event.error != null ? 'ERROR: ${event.error}' : '';
    var stackTraceStr =
        event.stackTrace != null ? 'STACKTRACE: ${event.stackTrace}' : '';
    var timeStr = 'TIME: ${DateTime.now().toIso8601String()}';

    list.addAll([
      '$messageStr',
      '$errorStr',
      '$stackTraceStr',
      '----------------------------------',
      '============= END ${event.logName} ${levelPrefixes[event.level]} =================',
    ]);
    return list;
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
