// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BooksStruct> _$booksStructSerializer = new _$BooksStructSerializer();

class _$BooksStructSerializer implements StructuredSerializer<BooksStruct> {
  @override
  final Iterable<Type> types = const [BooksStruct, _$BooksStruct];
  @override
  final String wireName = 'BooksStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, BooksStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BooksStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BooksStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$BooksStruct extends BooksStruct {
  @override
  final String? name;
  @override
  final String? author;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$BooksStruct([void Function(BooksStructBuilder)? updates]) =>
      (new BooksStructBuilder()..update(updates))._build();

  _$BooksStruct._({this.name, this.author, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'BooksStruct', 'firestoreUtilData');
  }

  @override
  BooksStruct rebuild(void Function(BooksStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BooksStructBuilder toBuilder() => new BooksStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BooksStruct &&
        name == other.name &&
        author == other.author &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BooksStruct')
          ..add('name', name)
          ..add('author', author)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class BooksStructBuilder implements Builder<BooksStruct, BooksStructBuilder> {
  _$BooksStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _author;
  String? get author => _$this._author;
  set author(String? author) => _$this._author = author;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  BooksStructBuilder() {
    BooksStruct._initializeBuilder(this);
  }

  BooksStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _author = $v.author;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BooksStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BooksStruct;
  }

  @override
  void update(void Function(BooksStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BooksStruct build() => _build();

  _$BooksStruct _build() {
    final _$result = _$v ??
        new _$BooksStruct._(
            name: name,
            author: author,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'BooksStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
