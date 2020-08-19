enum XLPriority {
  high,
  medium,
  low,
  non,
}

class XLEvent {
  static XLPriority _priority = XLPriority.medium;
  final String _pageName;

  XLEvent({String pageName, XLPriority priority}) : _pageName = pageName {
    _priority = priority ?? XLPriority.medium;
  }

  static log(dynamic message, {XLPriority priority, StackTrace stackTrace}) {
    
  }
}
