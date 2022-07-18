import 'package:flutter/material.dart';
import 'package:uas/data/remote/dosen_repository.dart';
import 'package:uas/model/dosen.dart';

import '../data/remote/viewstate.dart';

class DosenViewModel extends ChangeNotifier {
  final DosenRepository _dosenRepository = DosenRepositoryImpl();

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  List<Dosen> _listDosen = List.empty();
  List<Dosen> get listDosen => _listDosen;

  String? _message;
  String? get message => _message;

  String? _errorMsg;
  String? get errorMsg => _errorMsg;

  _changeState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  void getAllDosen() async {
    _changeState(ViewState.loading);
    var response = await _dosenRepository.getListDosen();
    var listDosen = response.data;

    _listDosen = listDosen ?? [];
    _changeState(ViewState.success);

    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }

  void addDosen(Dosen dosen) async {
    _changeState(ViewState.loading);
    var response = await _dosenRepository.addDosen(dosen);

    _message = response.data;
    _changeState(ViewState.success);

    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }

  void deleteDosen(int id) async {
    _changeState(ViewState.loading);
    var response = await _dosenRepository.deleteDosen(id);

    _message = response.data;
    _changeState(ViewState.success);

    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }

  void updateDosen(Dosen dosen) async {
    _changeState(ViewState.loading);
    var response = await _dosenRepository.updateDosen(dosen);

    _message = response.data;
    _changeState(ViewState.success);

    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }
}
