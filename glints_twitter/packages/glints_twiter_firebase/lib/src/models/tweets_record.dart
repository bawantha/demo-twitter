import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:glints_twiter_firebase/src/models/index.dart';
import 'package:glints_twiter_firebase/src/models/serializers.dart';

part 'tweets_record.g.dart';

abstract class TweetsRecord
    implements Built<TweetsRecord, TweetsRecordBuilder> {
  static Serializer<TweetsRecord> get serializer => _$tweetsRecordSerializer;

  String? get content;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  DocumentReference? get owner;

  @BuiltValueField(wireName: 'owner_email')
  String? get ownerEmail;

  @BuiltValueField(wireName: 'is_editing')
  bool? get isEditing;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TweetsRecordBuilder builder) => builder
    ..content = ''
    ..ownerEmail = ''
    ..isEditing = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tweets');

  static Stream<TweetsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TweetsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TweetsRecord._();
  factory TweetsRecord([void Function(TweetsRecordBuilder) updates]) =
  _$TweetsRecord;

  static TweetsRecord getDocumentFromData(
      Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTweetsRecordData({
  String? content,
  DateTime? createdDate,
  DocumentReference? owner,
  String? ownerEmail,
  bool? isEditing,
}) {
  final firestoreData = serializers.toFirestore(
    TweetsRecord.serializer,
    TweetsRecord(
          (t) => t
        ..content = content
        ..createdDate = createdDate
        ..owner = owner
        ..ownerEmail = ownerEmail
        ..isEditing = isEditing,
    ),
  );

  return firestoreData;
}
