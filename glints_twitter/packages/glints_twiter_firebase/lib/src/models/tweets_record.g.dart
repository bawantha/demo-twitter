// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweets_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TweetsRecord> _$tweetsRecordSerializer =
    new _$TweetsRecordSerializer();

class _$TweetsRecordSerializer implements StructuredSerializer<TweetsRecord> {
  @override
  final Iterable<Type> types = const [TweetsRecord, _$TweetsRecord];
  @override
  final String wireName = 'TweetsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TweetsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ownerEmail;
    if (value != null) {
      result
        ..add('owner_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isEditing;
    if (value != null) {
      result
        ..add('is_editing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  TweetsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TweetsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'owner_email':
          result.ownerEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_editing':
          result.isEditing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$TweetsRecord extends TweetsRecord {
  @override
  final String? content;
  @override
  final DateTime? createdDate;
  @override
  final DocumentReference<Object?>? owner;
  @override
  final String? ownerEmail;
  @override
  final bool? isEditing;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TweetsRecord([void Function(TweetsRecordBuilder)? updates]) =>
      (new TweetsRecordBuilder()..update(updates))._build();

  _$TweetsRecord._(
      {this.content,
      this.createdDate,
      this.owner,
      this.ownerEmail,
      this.isEditing,
      this.ffRef})
      : super._();

  @override
  TweetsRecord rebuild(void Function(TweetsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TweetsRecordBuilder toBuilder() => new TweetsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TweetsRecord &&
        content == other.content &&
        createdDate == other.createdDate &&
        owner == other.owner &&
        ownerEmail == other.ownerEmail &&
        isEditing == other.isEditing &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, content.hashCode), createdDate.hashCode),
                    owner.hashCode),
                ownerEmail.hashCode),
            isEditing.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TweetsRecord')
          ..add('content', content)
          ..add('createdDate', createdDate)
          ..add('owner', owner)
          ..add('ownerEmail', ownerEmail)
          ..add('isEditing', isEditing)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TweetsRecordBuilder
    implements Builder<TweetsRecord, TweetsRecordBuilder> {
  _$TweetsRecord? _$v;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  String? _ownerEmail;
  String? get ownerEmail => _$this._ownerEmail;
  set ownerEmail(String? ownerEmail) => _$this._ownerEmail = ownerEmail;

  bool? _isEditing;
  bool? get isEditing => _$this._isEditing;
  set isEditing(bool? isEditing) => _$this._isEditing = isEditing;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TweetsRecordBuilder() {
    TweetsRecord._initializeBuilder(this);
  }

  TweetsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _createdDate = $v.createdDate;
      _owner = $v.owner;
      _ownerEmail = $v.ownerEmail;
      _isEditing = $v.isEditing;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TweetsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TweetsRecord;
  }

  @override
  void update(void Function(TweetsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TweetsRecord build() => _build();

  _$TweetsRecord _build() {
    final _$result = _$v ??
        new _$TweetsRecord._(
            content: content,
            createdDate: createdDate,
            owner: owner,
            ownerEmail: ownerEmail,
            isEditing: isEditing,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
