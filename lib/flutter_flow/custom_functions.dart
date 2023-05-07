import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

String? concatArrayValues(List<String>? values) {
  return values?.join('\n\n');
}

String replaceText(
  String text,
  String newChar,
) {
  //text = text.replaceAll(RegExp('[\r\n]+'), newChar);
  text = text.replaceAll('\"', '\\"');
  //text = text.replaceAll('\”', '\\\”');
  //text = text.replaceAll('\“', '\\\“');
  //text = text.replaceAll('\„', '\\\„');
  //text = text.replaceAll('\'', '\\\'');
  return text.replaceAll(RegExp('[\r\n]+'), newChar);
}

String stringLengthRestrict(
  String? input,
  int? cutoffLength,
) {
  // Add your function code here!
  return (input!.length <= cutoffLength!)
      ? input
      : '${input.substring(0, cutoffLength)}';
}

String capitalizeText(String text) {
  return text[0].toUpperCase() + text.substring(1);
}
