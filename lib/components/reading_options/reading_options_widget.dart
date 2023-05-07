import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reading_options_model.dart';
export 'reading_options_model.dart';

class ReadingOptionsWidget extends StatefulWidget {
  const ReadingOptionsWidget({Key? key}) : super(key: key);

  @override
  _ReadingOptionsWidgetState createState() => _ReadingOptionsWidgetState();
}

class _ReadingOptionsWidgetState extends State<ReadingOptionsWidget> {
  late ReadingOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadingOptionsModel());

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

    return Container(
      width: double.infinity,
      height: 180.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'FontSize',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            Container(
              width: 160.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0xFF9E9E9E),
                  width: 1.0,
                ),
              ),
              child: FlutterFlowCountController(
                decrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.minus,
                  color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                  size: 20.0,
                ),
                incrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.plus,
                  color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                  size: 20.0,
                ),
                countBuilder: (count) => Text(
                  count.toString(),
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                count: _model.countControllerValue ??= FFAppState().FontSize,
                updateCount: (count) async {
                  setState(() => _model.countControllerValue = count);
                  logFirebaseEvent('READING_OPTIONS_CountController_3plce8em');
                  logFirebaseEvent('CountController_update_app_state');
                  FFAppState().update(() {
                    FFAppState().FontSize = _model.countControllerValue!;
                  });
                },
                stepSize: 1,
                minimum: 14,
                maximum: 22,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('READING_OPTIONS_Text_ekp1rt34_ON_TAP');
                  logFirebaseEvent('Text_update_app_state');
                  FFAppState().update(() {
                    FFAppState().FontSize = 18;
                  });
                  logFirebaseEvent('Text_set_form_field');
                  setState(() {
                    _model.countControllerValue = FFAppState().FontSize;
                  });
                },
                child: Text(
                  'Reset font size',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 14.0,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
