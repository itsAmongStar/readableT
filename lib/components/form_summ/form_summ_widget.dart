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
import 'form_summ_model.dart';
export 'form_summ_model.dart';

class FormSummWidget extends StatefulWidget {
  const FormSummWidget({Key? key}) : super(key: key);

  @override
  _FormSummWidgetState createState() => _FormSummWidgetState();
}

class _FormSummWidgetState extends State<FormSummWidget> {
  late FormSummModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormSummModel());

    _model.textURLController ??=
        TextEditingController(text: FFAppState().sharedString);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 450.0,
                ),
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 15.0),
                  child: TextFormField(
                    controller: _model.textURLController,
                    onChanged: (value) {
                      FFAppState().sharedString = '';
                      EasyDebounce.debounce(
                        '_model.textURLController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      );
                    },
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).grayIcon,
                              ),
                      hintText: 'Enter link to web article...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).grayIcon,
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).lineColor,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 25.0, 25.0, 25.0),
                      suffixIcon: _model.textURLController!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textURLController?.clear();
                                FFAppState().sharedString = '';
                                setState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: Color(0xFF757575),
                                size: 22.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    keyboardType: TextInputType.url,
                    validator:
                        _model.textURLControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('FORM_SUMM_COMP_SUMMARIZE_BTN_ON_TAP');
                    logFirebaseEvent('Button_validate_form');
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    logFirebaseEvent('Button_backend_call');
                    _model.responseArtExt = await ArticleExtractorCall.call(
                      urlAddress: _model.textURLController.text,
                    );
                    if (ArticleExtractorCall.lang(
                          (_model.responseArtExt?.jsonBody ?? ''),
                        ).toString() ==
                        'en') {
                      logFirebaseEvent('Button_update_widget_state');
                      setState(() {
                        _model.textToSummarise = functions.stringLengthRestrict(
                            ArticleExtractorCall.text(
                              (_model.responseArtExt?.jsonBody ?? ''),
                            ).toString(),
                            16000);
                      });
                    } else {
                      logFirebaseEvent('Button_update_widget_state');
                      setState(() {
                        _model.textToSummarise = functions.stringLengthRestrict(
                            ArticleExtractorCall.text(
                              (_model.responseArtExt?.jsonBody ?? ''),
                            ).toString(),
                            7000);
                      });
                    }

                    logFirebaseEvent('Button_update_widget_state');
                    setState(() {
                      _model.textToSummarise = functions.replaceText(
                          _model.textToSummarise!, '\\n\\n');
                    });
                    logFirebaseEvent('Button_backend_call');
                    _model.responseOpenAI = await OpenAICall.call(
                      articleText: _model.textToSummarise,
                    );
                    logFirebaseEvent('Button_backend_call');

                    final postsCreateData = createPostsRecordData(
                      postOriginal: ArticleExtractorCall.text(
                        (_model.responseArtExt?.jsonBody ?? ''),
                      ).toString(),
                      postPhoto: ArticleExtractorCall.image(
                        (_model.responseArtExt?.jsonBody ?? ''),
                      ),
                      postTitle:
                          functions.capitalizeText(ArticleExtractorCall.title(
                        (_model.responseArtExt?.jsonBody ?? ''),
                      ).toString()),
                      postUrl: _model.textURLController.text,
                      timePosted: getCurrentTimestamp,
                      postAuthor: getJsonField(
                        (_model.responseArtExt?.jsonBody ?? ''),
                        r'''$.data.authors[0]''',
                      ).toString(),
                      postSummary: OpenAICall.summary(
                        (_model.responseOpenAI?.jsonBody ?? ''),
                      ).toString(),
                      postTokens: OpenAICall.tokens(
                        (_model.responseOpenAI?.jsonBody ?? ''),
                      ),
                      postTempUser: FFAppState().TemporaryID,
                      postLang: ArticleExtractorCall.lang(
                        (_model.responseArtExt?.jsonBody ?? ''),
                      ).toString(),
                    );
                    var postsRecordReference = PostsRecord.collection.doc();
                    await postsRecordReference.set(postsCreateData);
                    _model.savedPost = PostsRecord.getDocumentFromData(
                        postsCreateData, postsRecordReference);
                    logFirebaseEvent('Button_bottom_sheet');
                    Navigator.pop(context);
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed(
                      'Article',
                      queryParams: {
                        'post': serializeParam(
                          _model.savedPost,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'post': _model.savedPost,
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                        ),
                      },
                    );

                    setState(() {});
                  },
                  text: 'Summarize',
                  options: FFButtonOptions(
                    width: 250.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 25.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Text(
                  FFAppState().InputSummaryValid,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontSize: 12.0,
                        lineHeight: 1.2,
                      ),
                ),
              ),
              if ('1' == '2')
                SelectionArea(
                    child: Text(
                  _model.textToSummarise!,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                )),
            ],
          ),
        ),
      ),
    );
  }
}
