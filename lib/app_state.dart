import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _InputSummaryValid =
        prefs.getString('ff_InputSummaryValid') ?? _InputSummaryValid;
    _SummariesUserFilter =
        prefs.getString('ff_SummariesUserFilter')?.ref ?? _SummariesUserFilter;
    _SummariesHeader =
        prefs.getString('ff_SummariesHeader') ?? _SummariesHeader;
    _DarkMode = prefs.getBool('ff_DarkMode') ?? _DarkMode;
    _TemporaryID = prefs.getInt('ff_TemporaryID') ?? _TemporaryID;
    _FilterType = prefs.getString('ff_FilterType') ?? _FilterType;
    _FontSize = prefs.getInt('ff_FontSize') ?? _FontSize;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _sharedString = '';
  String get sharedString => _sharedString;
  set sharedString(String _value) {
    _sharedString = _value;
  }

  String _InputSummaryValid = '';
  String get InputSummaryValid => _InputSummaryValid;
  set InputSummaryValid(String _value) {
    _InputSummaryValid = _value;
    prefs.setString('ff_InputSummaryValid', _value);
  }

  DocumentReference? _SummariesUserFilter;
  DocumentReference? get SummariesUserFilter => _SummariesUserFilter;
  set SummariesUserFilter(DocumentReference? _value) {
    _SummariesUserFilter = _value;
    _value != null
        ? prefs.setString('ff_SummariesUserFilter', _value.path)
        : prefs.remove('ff_SummariesUserFilter');
  }

  String _SummariesHeader = 'All Summaries';
  String get SummariesHeader => _SummariesHeader;
  set SummariesHeader(String _value) {
    _SummariesHeader = _value;
    prefs.setString('ff_SummariesHeader', _value);
  }

  bool _DarkMode = false;
  bool get DarkMode => _DarkMode;
  set DarkMode(bool _value) {
    _DarkMode = _value;
    prefs.setBool('ff_DarkMode', _value);
  }

  int _TemporaryID = 0;
  int get TemporaryID => _TemporaryID;
  set TemporaryID(int _value) {
    _TemporaryID = _value;
    prefs.setInt('ff_TemporaryID', _value);
  }

  String _FilterType = 'AllSummaries';
  String get FilterType => _FilterType;
  set FilterType(String _value) {
    _FilterType = _value;
    prefs.setString('ff_FilterType', _value);
  }

  int _FontSize = 18;
  int get FontSize => _FontSize;
  set FontSize(int _value) {
    _FontSize = _value;
    prefs.setInt('ff_FontSize', _value);
  }

  String _CurrentUrl = '';
  String get CurrentUrl => _CurrentUrl;
  set CurrentUrl(String _value) {
    _CurrentUrl = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
