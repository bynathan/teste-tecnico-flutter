import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/core/models/motel_model.dart';
import 'package:flutter_technical_test_motel_list/core/services/motel_service.dart';

class MotelState with ChangeNotifier {
  final MotelService _motelService;

  MotelState(this._motelService);

  List<Motel> _motels = [];
  bool _loading = false;

  List<Motel> get motels => _motels;
  bool get loading => _loading;

  Future<void> loadMotels() async {
    _loading = true;
    notifyListeners(); // Notifica a UI que o loading começou

    try {
      _motels = await _motelService.fetchMotels();
    } catch (e) {
      _motels = [];
    }

    _loading = false;
    notifyListeners(); // Notifica a UI que o loading terminou
  }
}
