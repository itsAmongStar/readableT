import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @BuiltValueField(wireName: 'post_photo')
  String? get postPhoto;

  @BuiltValueField(wireName: 'post_title')
  String? get postTitle;

  @BuiltValueField(wireName: 'post_user')
  DocumentReference? get postUser;

  @BuiltValueField(wireName: 'time_posted')
  DateTime? get timePosted;

  @BuiltValueField(wireName: 'post_author')
  String? get postAuthor;

  @BuiltValueField(wireName: 'post_url')
  String? get postUrl;

  @BuiltValueField(wireName: 'post_original')
  String? get postOriginal;

  @BuiltValueField(wireName: 'post_summary')
  String? get postSummary;

  @BuiltValueField(wireName: 'post_api_ok')
  bool? get postApiOk;

  @BuiltValueField(wireName: 'post_api_response_time')
  double? get postApiResponseTime;

  @BuiltValueField(wireName: 'post_temp_user')
  int? get postTempUser;

  @BuiltValueField(wireName: 'post_tokens')
  int? get postTokens;

  @BuiltValueField(wireName: 'post_lang')
  String? get postLang;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..postPhoto = ''
    ..postTitle = ''
    ..postAuthor = ''
    ..postUrl = ''
    ..postOriginal = ''
    ..postSummary = ''
    ..postApiOk = false
    ..postApiResponseTime = 0.0
    ..postTempUser = 0
    ..postTokens = 0
    ..postLang = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostsRecordData({
  String? postPhoto,
  String? postTitle,
  DocumentReference? postUser,
  DateTime? timePosted,
  String? postAuthor,
  String? postUrl,
  String? postOriginal,
  String? postSummary,
  bool? postApiOk,
  double? postApiResponseTime,
  int? postTempUser,
  int? postTokens,
  String? postLang,
}) {
  final firestoreData = serializers.toFirestore(
    PostsRecord.serializer,
    PostsRecord(
      (p) => p
        ..postPhoto = postPhoto
        ..postTitle = postTitle
        ..postUser = postUser
        ..timePosted = timePosted
        ..postAuthor = postAuthor
        ..postUrl = postUrl
        ..postOriginal = postOriginal
        ..postSummary = postSummary
        ..postApiOk = postApiOk
        ..postApiResponseTime = postApiResponseTime
        ..postTempUser = postTempUser
        ..postTokens = postTokens
        ..postLang = postLang,
    ),
  );

  return firestoreData;
}
