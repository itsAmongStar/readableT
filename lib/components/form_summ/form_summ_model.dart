import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormSummModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? textToSummarise = 'default';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextURL widget.
  TextEditingController? textURLController;
  String? Function(BuildContext, String?)? textURLControllerValidator;
  // Stores action output result for [Backend Call - API (ArticleExtractor)] action in Button widget.
  ApiCallResponse? responseArtExt;
  // Stores action output result for [Backend Call - API (OpenAI)] action in Button widget.
  ApiCallResponse? responseOpenAI;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostsRecord? savedPost;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textURLController?.dispose();
  }

  /// Additional helper methods are added here.

}
