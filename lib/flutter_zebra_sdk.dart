import 'dart:async';

import 'package:flutter/services.dart';

class ZebraSdk {
  static const MethodChannel _channel =
      const MethodChannel('flutter_zebra_sdk');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> printZPLOverTCPIP(String ipAddress, {int port, String data}) async {
    final Map<String, dynamic> params = {"ip": ipAddress};
    if (port != null) {
      params['port'] = port;
    }
    if (data != null) {
      params['data'] = data;
    }
    return await _channel.invokeMethod('printZPLOverTCPIP', params);
  }

  static Future<String> printZPLOverBluetooth(String macAddress, {String data}) async {
    final Map<String, dynamic> params = {"mac": macAddress};
    if (data != null) {
      params['data'] = data;
    }
    return await _channel.invokeMethod('printZPLOverBluetooth', params);
  }

}
