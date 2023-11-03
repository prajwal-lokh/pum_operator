class OrdersModal {
  final String operation;
  // final String orderno;
  final yield;
  final rework;
  final rejection;
  final String items;

  OrdersModal({
    required this.operation,
    required this.items,
    required this.yield,
    required this.rework,
    required this.rejection,
  });
}
