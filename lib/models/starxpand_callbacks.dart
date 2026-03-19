import 'dart:typed_data';

import 'starxpand_printer.dart';

typedef StarXpandCallback<T extends StarXpandCallbackPayload> = void Function(T payload);

class StarXpandCallbackHandler<T extends StarXpandCallbackPayload> {
  final T Function(String type, Map<String, dynamic> data)? payloadBuilder;
  final StarXpandCallback<T> callback;

  StarXpandCallbackHandler(this.callback, this.payloadBuilder);

  @override
  String toString() {
    return "StarXpandCallbackHandler payloadBuilder: $payloadBuilder, callback: $callback";
  }

  void call(String type, Map<String, dynamic> data) {
    var payload = payloadBuilder?.call(type, data) ?? StarXpandCallbackPayload(type, data) as T;
    callback(payload);
  }
}

class StarXpandCallbackPayload {
  late final String type;
  late final Map<String, dynamic> data;

  StarXpandCallbackPayload(this.type, Map<String, dynamic> payload) {
    data = payload;
    fromMap(data);
  }

  void fromMap(Map<String, dynamic> data) {}
}

class StarXpandPrinterPayload extends StarXpandCallbackPayload {
  late final StarXpandPrinter printer;

  StarXpandPrinterPayload(super.type, super.payload);

  @override
  fromMap(Map<String, dynamic> data) {
    printer = StarXpandPrinter.fromMap(data);
  }

  @override
  String toString() {
    return "StarXpandPrinterPayload: printer: $printer";
  }
}

class StarXpandInputPayload extends StarXpandCallbackPayload {
  late final String inputString;
  late final Uint8List inputData;

  StarXpandInputPayload(super.type, super.payload);

  @override
  fromMap(Map<String, dynamic> data) {
    inputString = data["string"];
    inputData = data["data"];
  }
}
