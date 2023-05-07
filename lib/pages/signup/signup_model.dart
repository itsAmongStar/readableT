import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailField widget.
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  String? _emailFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter email like user@domain.com';
    }
    return null;
  }

  // State field(s) for PassField widget.
  TextEditingController? passFieldController;
  late bool passFieldVisibility;
  String? Function(BuildContext, String?)? passFieldControllerValidator;
  String? _passFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Password need to have at least 6 characters';
    }

    return null;
  }

  // State field(s) for PassFieldRepeat widget.
  TextEditingController? passFieldRepeatController;
  late bool passFieldRepeatVisibility;
  String? Function(BuildContext, String?)? passFieldRepeatControllerValidator;
  String? _passFieldRepeatControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailFieldControllerValidator = _emailFieldControllerValidator;
    passFieldVisibility = false;
    passFieldControllerValidator = _passFieldControllerValidator;
    passFieldRepeatVisibility = false;
    passFieldRepeatControllerValidator = _passFieldRepeatControllerValidator;
  }

  void dispose() {
    emailFieldController?.dispose();
    passFieldController?.dispose();
    passFieldRepeatController?.dispose();
  }

  /// Additional helper methods are added here.

}
