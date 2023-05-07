import '/components/form_summ/form_summ_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSumNewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for FormSumm component.
  late FormSummModel formSummModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    formSummModel = createModel(context, () => FormSummModel());
  }

  void dispose() {
    formSummModel.dispose();
  }

  /// Additional helper methods are added here.

}
