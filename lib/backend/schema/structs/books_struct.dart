import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'books_struct.g.dart';

abstract class BooksStruct implements Built<BooksStruct, BooksStructBuilder> {
  static Serializer<BooksStruct> get serializer => _$booksStructSerializer;

  String? get name;

  String? get author;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(BooksStructBuilder builder) => builder
    ..name = ''
    ..author = ''
    ..firestoreUtilData = FirestoreUtilData();

  BooksStruct._();
  factory BooksStruct([void Function(BooksStructBuilder) updates]) =
      _$BooksStruct;
}

BooksStruct createBooksStruct({
  String? name,
  String? author,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BooksStruct(
      (b) => b
        ..name = name
        ..author = author
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

BooksStruct? updateBooksStruct(
  BooksStruct? books, {
  bool clearUnsetFields = true,
}) =>
    books != null
        ? (books.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addBooksStructData(
  Map<String, dynamic> firestoreData,
  BooksStruct? books,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (books == null) {
    return;
  }
  if (books.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && books.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final booksData = getBooksFirestoreData(books, forFieldValue);
  final nestedData = booksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = books.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getBooksFirestoreData(
  BooksStruct? books, [
  bool forFieldValue = false,
]) {
  if (books == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(BooksStruct.serializer, books);

  // Add any Firestore field values
  books.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBooksListFirestoreData(
  List<BooksStruct>? bookss,
) =>
    bookss?.map((b) => getBooksFirestoreData(b, true)).toList() ?? [];
