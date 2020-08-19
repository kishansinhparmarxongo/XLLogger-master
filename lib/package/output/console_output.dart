import '../log_output.dart';
import '../xllogger.dart';
import 'dart:math' as math;

/// Default implementation of [LogOutput].
///
/// It sends everything to the system console.
class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(print);
  }
  void _printBlock(String msg) {
    var maxWidth = 50;
    int lines = (msg.length / maxWidth).ceil();
    for (int i = 0; i < lines; ++i) {
      print((i >= 0 ? '║ ' : '') +
          msg.substring(i * maxWidth,
              math.min<int>(i * maxWidth + maxWidth, msg.length)));
    }
  }
}
