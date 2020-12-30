// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Diary> _$diarySerializer = new _$DiarySerializer();

class _$DiarySerializer implements StructuredSerializer<Diary> {
  @override
  final Iterable<Type> types = const [Diary, _$Diary];
  @override
  final String wireName = 'Diary';

  @override
  Iterable<Object> serialize(Serializers serializers, Diary object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'question_id',
      serializers.serialize(object.questionId,
          specifiedType: const FullType(int)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateTime)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.color != null) {
      result
        ..add('color')
        ..add(serializers.serialize(object.color,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Diary deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'question_id':
          result.questionId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Diary extends Diary {
  @override
  final int id;
  @override
  final int questionId;
  @override
  final String text;
  @override
  final DateTime createdAt;
  @override
  final int color;

  factory _$Diary([void Function(DiaryBuilder) updates]) =>
      (new DiaryBuilder()..update(updates)).build();

  _$Diary._({this.id, this.questionId, this.text, this.createdAt, this.color})
      : super._() {
    if (questionId == null) {
      throw new BuiltValueNullFieldError('Diary', 'questionId');
    }
    if (text == null) {
      throw new BuiltValueNullFieldError('Diary', 'text');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('Diary', 'createdAt');
    }
  }

  @override
  Diary rebuild(void Function(DiaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryBuilder toBuilder() => new DiaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Diary &&
        id == other.id &&
        questionId == other.questionId &&
        text == other.text &&
        createdAt == other.createdAt &&
        color == other.color;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), questionId.hashCode), text.hashCode),
            createdAt.hashCode),
        color.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Diary')
          ..add('id', id)
          ..add('questionId', questionId)
          ..add('text', text)
          ..add('createdAt', createdAt)
          ..add('color', color))
        .toString();
  }
}

class DiaryBuilder implements Builder<Diary, DiaryBuilder> {
  _$Diary _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _questionId;
  int get questionId => _$this._questionId;
  set questionId(int questionId) => _$this._questionId = questionId;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  DiaryBuilder();

  DiaryBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _questionId = _$v.questionId;
      _text = _$v.text;
      _createdAt = _$v.createdAt;
      _color = _$v.color;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Diary other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Diary;
  }

  @override
  void update(void Function(DiaryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Diary build() {
    final _$result = _$v ??
        new _$Diary._(
            id: id,
            questionId: questionId,
            text: text,
            createdAt: createdAt,
            color: color);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
