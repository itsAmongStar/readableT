import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_listview_model.dart';
export 'empty_listview_model.dart';

class EmptyListviewWidget extends StatefulWidget {
  const EmptyListviewWidget({Key? key}) : super(key: key);

  @override
  _EmptyListviewWidgetState createState() => _EmptyListviewWidgetState();
}

class _EmptyListviewWidgetState extends State<EmptyListviewWidget> {
  late EmptyListviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListviewModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
          child: Text(
            'Click + icon on navbar below and add your first link for summarising',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).grayIcon,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
          child: Icon(
            Icons.arrow_downward_outlined,
            color: FlutterFlowTheme.of(context).grayIcon,
            size: 44.0,
          ),
        ),
      ],
    );
  }
}
