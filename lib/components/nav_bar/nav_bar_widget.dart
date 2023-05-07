import '/components/add_sum_new/add_sum_new_widget.dart';
import '/components/options/options_widget.dart';
import '/components/reading_options/reading_options_widget.dart';
import '/components/sum_filter/sum_filter_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    Key? key,
    this.currentPage,
    this.originalURL,
    this.summaryURL,
  }) : super(key: key);

  final String? currentPage;
  final String? originalURL;
  final String? summaryURL;

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: Color(0x23262626),
                offset: Offset(0.0, -10.0),
                spreadRadius: 0.1,
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 700.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.currentPage == 'List')
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.home_rounded,
                                  color: Color(0xFF9299A1),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_COMP_home_rounded_ICN_ON_TAP');
                                  if (widget.currentPage == 'List') {
                                    return;
                                  }

                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed(
                                    'List',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.leftToRight,
                                        duration: Duration(milliseconds: 300),
                                      ),
                                    },
                                  );
                                },
                              ),
                              if ((Theme.of(context).brightness ==
                                      Brightness.dark) ==
                                  true)
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidMoon,
                                    color: Color(0xFF9299A1),
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'NAV_BAR_COMP_solidMoon_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    setState(() {
                                      FFAppState().DarkMode = false;
                                    });
                                    logFirebaseEvent(
                                        'IconButton_set_dark_mode_settings');
                                    setDarkModeSetting(
                                      context,
                                      FFAppState().DarkMode
                                          ? ThemeMode.dark
                                          : ThemeMode.light,
                                    );
                                  },
                                ),
                              if ((Theme.of(context).brightness ==
                                      Brightness.dark) ==
                                  false)
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.wb_sunny,
                                    color: Color(0xFF9299A1),
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'NAV_BAR_COMP_wb_sunny_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    setState(() {
                                      FFAppState().DarkMode = true;
                                    });
                                    logFirebaseEvent(
                                        'IconButton_set_dark_mode_settings');
                                    setDarkModeSetting(
                                      context,
                                      FFAppState().DarkMode
                                          ? ThemeMode.dark
                                          : ThemeMode.light,
                                    );
                                  },
                                ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 25.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 40.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_COMP_MiddleButton_ON_TAP');
                                  logFirebaseEvent(
                                      'MiddleButton_update_app_state');
                                  FFAppState().update(() {
                                    FFAppState().InputSummaryValid = '';
                                  });
                                  logFirebaseEvent('MiddleButton_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(bottomSheetContext)
                                                .viewInsets,
                                        child: AddSumNewWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.filter_list,
                                  color: Color(0xFF9299A1),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_COMP_filter_list_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(bottomSheetContext)
                                                .viewInsets,
                                        child: SumFilterWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.keyboard_control_rounded,
                                  color: Color(0xFF9299A1),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_keyboard_control_rounded_ICN_ON_');
                                  logFirebaseEvent('IconButton_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(bottomSheetContext)
                                                .viewInsets,
                                        child: OptionsWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                              ),
                            ],
                          ),
                        ),
                      if (widget.currentPage == 'Article')
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xFF9299A1),
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'NAV_BAR_COMP_arrow_back_ios_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_to');

                            context.pushNamed(
                              'List',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.leftToRight,
                                ),
                              },
                            );
                          },
                        ),
                      if (widget.currentPage == 'Article')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((Theme.of(context).brightness ==
                                    Brightness.dark) ==
                                true)
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.solidMoon,
                                  color: Color(0xFF9299A1),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_COMP_solidMoon_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  setState(() {
                                    FFAppState().DarkMode = false;
                                  });
                                  logFirebaseEvent(
                                      'IconButton_set_dark_mode_settings');
                                  setDarkModeSetting(
                                    context,
                                    FFAppState().DarkMode
                                        ? ThemeMode.dark
                                        : ThemeMode.light,
                                  );
                                },
                              ),
                            if ((Theme.of(context).brightness ==
                                    Brightness.dark) ==
                                false)
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.wb_sunny,
                                  color: Color(0xFF9299A1),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_COMP_wb_sunny_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  setState(() {
                                    FFAppState().DarkMode = true;
                                  });
                                  logFirebaseEvent(
                                      'IconButton_set_dark_mode_settings');
                                  setDarkModeSetting(
                                    context,
                                    FFAppState().DarkMode
                                        ? ThemeMode.dark
                                        : ThemeMode.light,
                                  );
                                },
                              ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.link_rounded,
                                color: Color(0xFF9299A1),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_COMP_link_rounded_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_launch_u_r_l');
                                await launchURL(widget.originalURL!);
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.text_fields,
                                color: Color(0xFF9299A1),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NAV_BAR_COMP_text_fields_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x00000000),
                                  context: context,
                                  builder: (bottomSheetContext) {
                                    return Padding(
                                      padding: MediaQuery.of(bottomSheetContext)
                                          .viewInsets,
                                      child: ReadingOptionsWidget(),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                            ),
                            if (isWeb != true)
                              Builder(
                                builder: (context) => FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 25.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    Icons.ios_share,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'NAV_BAR_COMP_MiddleButton_ON_TAP');
                                    logFirebaseEvent('MiddleButton_share');
                                    await Share.share(
                                      widget.summaryURL!,
                                      sharePositionOrigin:
                                          getWidgetBoundingBox(context),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
