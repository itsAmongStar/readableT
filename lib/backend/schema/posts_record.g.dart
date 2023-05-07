// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsRecord> _$postsRecordSerializer = new _$PostsRecordSerializer();

class _$PostsRecordSerializer implements StructuredSerializer<PostsRecord> {
  @override
  final Iterable<Type> types = const [PostsRecord, _$PostsRecord];
  @override
  final String wireName = 'PostsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.postPhoto;
    if (value != null) {
      result
        ..add('post_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postTitle;
    if (value != null) {
      result
        ..add('post_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postUser;
    if (value != null) {
      result
        ..add('post_user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.timePosted;
    if (value != null) {
      result
        ..add('time_posted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.postAuthor;
    if (value != null) {
      result
        ..add('post_author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postUrl;
    if (value != null) {
      result
        ..add('post_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postOriginal;
    if (value != null) {
      result
        ..add('post_original')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postSummary;
    if (value != null) {
      result
        ..add('post_summary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postApiOk;
    if (value != null) {
      result
        ..add('post_api_ok')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.postApiResponseTime;
    if (value != null) {
      result
        ..add('post_api_response_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.postTempUser;
    if (value != null) {
      result
        ..add('post_temp_user')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.postTokens;
    if (value != null) {
      result
        ..add('post_tokens')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.postLang;
    if (value != null) {
      result
        ..add('post_lang')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PostsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'post_photo':
          result.postPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_title':
          result.postTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_user':
          result.postUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'time_posted':
          result.timePosted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'post_author':
          result.postAuthor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_url':
          result.postUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_original':
          result.postOriginal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_summary':
          result.postSummary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_api_ok':
          result.postApiOk = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'post_api_response_time':
          result.postApiResponseTime = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'post_temp_user':
          result.postTempUser = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'post_tokens':
          result.postTokens = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'post_lang':
          result.postLang = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PostsRecord extends PostsRecord {
  @override
  final String? postPhoto;
  @override
  final String? postTitle;
  @override
  final DocumentReference<Object?>? postUser;
  @override
  final DateTime? timePosted;
  @override
  final String? postAuthor;
  @override
  final String? postUrl;
  @override
  final String? postOriginal;
  @override
  final String? postSummary;
  @override
  final bool? postApiOk;
  @override
  final double? postApiResponseTime;
  @override
  final int? postTempUser;
  @override
  final int? postTokens;
  @override
  final String? postLang;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PostsRecord([void Function(PostsRecordBuilder)? updates]) =>
      (new PostsRecordBuilder()..update(updates))._build();

  _$PostsRecord._(
      {this.postPhoto,
      this.postTitle,
      this.postUser,
      this.timePosted,
      this.postAuthor,
      this.postUrl,
      this.postOriginal,
      this.postSummary,
      this.postApiOk,
      this.postApiResponseTime,
      this.postTempUser,
      this.postTokens,
      this.postLang,
      this.ffRef})
      : super._();

  @override
  PostsRecord rebuild(void Function(PostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsRecordBuilder toBuilder() => new PostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsRecord &&
        postPhoto == other.postPhoto &&
        postTitle == other.postTitle &&
        postUser == other.postUser &&
        timePosted == other.timePosted &&
        postAuthor == other.postAuthor &&
        postUrl == other.postUrl &&
        postOriginal == other.postOriginal &&
        postSummary == other.postSummary &&
        postApiOk == other.postApiOk &&
        postApiResponseTime == other.postApiResponseTime &&
        postTempUser == other.postTempUser &&
        postTokens == other.postTokens &&
        postLang == other.postLang &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, postPhoto.hashCode);
    _$hash = $jc(_$hash, postTitle.hashCode);
    _$hash = $jc(_$hash, postUser.hashCode);
    _$hash = $jc(_$hash, timePosted.hashCode);
    _$hash = $jc(_$hash, postAuthor.hashCode);
    _$hash = $jc(_$hash, postUrl.hashCode);
    _$hash = $jc(_$hash, postOriginal.hashCode);
    _$hash = $jc(_$hash, postSummary.hashCode);
    _$hash = $jc(_$hash, postApiOk.hashCode);
    _$hash = $jc(_$hash, postApiResponseTime.hashCode);
    _$hash = $jc(_$hash, postTempUser.hashCode);
    _$hash = $jc(_$hash, postTokens.hashCode);
    _$hash = $jc(_$hash, postLang.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostsRecord')
          ..add('postPhoto', postPhoto)
          ..add('postTitle', postTitle)
          ..add('postUser', postUser)
          ..add('timePosted', timePosted)
          ..add('postAuthor', postAuthor)
          ..add('postUrl', postUrl)
          ..add('postOriginal', postOriginal)
          ..add('postSummary', postSummary)
          ..add('postApiOk', postApiOk)
          ..add('postApiResponseTime', postApiResponseTime)
          ..add('postTempUser', postTempUser)
          ..add('postTokens', postTokens)
          ..add('postLang', postLang)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PostsRecordBuilder implements Builder<PostsRecord, PostsRecordBuilder> {
  _$PostsRecord? _$v;

  String? _postPhoto;
  String? get postPhoto => _$this._postPhoto;
  set postPhoto(String? postPhoto) => _$this._postPhoto = postPhoto;

  String? _postTitle;
  String? get postTitle => _$this._postTitle;
  set postTitle(String? postTitle) => _$this._postTitle = postTitle;

  DocumentReference<Object?>? _postUser;
  DocumentReference<Object?>? get postUser => _$this._postUser;
  set postUser(DocumentReference<Object?>? postUser) =>
      _$this._postUser = postUser;

  DateTime? _timePosted;
  DateTime? get timePosted => _$this._timePosted;
  set timePosted(DateTime? timePosted) => _$this._timePosted = timePosted;

  String? _postAuthor;
  String? get postAuthor => _$this._postAuthor;
  set postAuthor(String? postAuthor) => _$this._postAuthor = postAuthor;

  String? _postUrl;
  String? get postUrl => _$this._postUrl;
  set postUrl(String? postUrl) => _$this._postUrl = postUrl;

  String? _postOriginal;
  String? get postOriginal => _$this._postOriginal;
  set postOriginal(String? postOriginal) => _$this._postOriginal = postOriginal;

  String? _postSummary;
  String? get postSummary => _$this._postSummary;
  set postSummary(String? postSummary) => _$this._postSummary = postSummary;

  bool? _postApiOk;
  bool? get postApiOk => _$this._postApiOk;
  set postApiOk(bool? postApiOk) => _$this._postApiOk = postApiOk;

  double? _postApiResponseTime;
  double? get postApiResponseTime => _$this._postApiResponseTime;
  set postApiResponseTime(double? postApiResponseTime) =>
      _$this._postApiResponseTime = postApiResponseTime;

  int? _postTempUser;
  int? get postTempUser => _$this._postTempUser;
  set postTempUser(int? postTempUser) => _$this._postTempUser = postTempUser;

  int? _postTokens;
  int? get postTokens => _$this._postTokens;
  set postTokens(int? postTokens) => _$this._postTokens = postTokens;

  String? _postLang;
  String? get postLang => _$this._postLang;
  set postLang(String? postLang) => _$this._postLang = postLang;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PostsRecordBuilder() {
    PostsRecord._initializeBuilder(this);
  }

  PostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postPhoto = $v.postPhoto;
      _postTitle = $v.postTitle;
      _postUser = $v.postUser;
      _timePosted = $v.timePosted;
      _postAuthor = $v.postAuthor;
      _postUrl = $v.postUrl;
      _postOriginal = $v.postOriginal;
      _postSummary = $v.postSummary;
      _postApiOk = $v.postApiOk;
      _postApiResponseTime = $v.postApiResponseTime;
      _postTempUser = $v.postTempUser;
      _postTokens = $v.postTokens;
      _postLang = $v.postLang;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsRecord;
  }

  @override
  void update(void Function(PostsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostsRecord build() => _build();

  _$PostsRecord _build() {
    final _$result = _$v ??
        new _$PostsRecord._(
            postPhoto: postPhoto,
            postTitle: postTitle,
            postUser: postUser,
            timePosted: timePosted,
            postAuthor: postAuthor,
            postUrl: postUrl,
            postOriginal: postOriginal,
            postSummary: postSummary,
            postApiOk: postApiOk,
            postApiResponseTime: postApiResponseTime,
            postTempUser: postTempUser,
            postTokens: postTokens,
            postLang: postLang,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
