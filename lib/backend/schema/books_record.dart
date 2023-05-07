import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'books_record.g.dart';

abstract class BooksRecord implements Built<BooksRecord, BooksRecordBuilder> {
  static Serializer<BooksRecord> get serializer => _$booksRecordSerializer;

  @BuiltValueField(wireName: 'book_list')
  BuiltList<String>? get bookList;

  @BuiltValueField(wireName: 'list_b')
  BuiltList<BooksStruct>? get listB;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BooksRecordBuilder builder) => builder
    ..bookList = ListBuilder()
    ..listB = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('books');

  static Stream<BooksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BooksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BooksRecord._();
  factory BooksRecord([void Function(BooksRecordBuilder) updates]) =
      _$BooksRecord;

  static BooksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBooksRecordData() {
  final firestoreData = serializers.toFirestore(
    BooksRecord.serializer,
    BooksRecord(
      (b) => b
        ..bookList = null
        ..listB = null,
    ),
  );

  return firestoreData;
}
