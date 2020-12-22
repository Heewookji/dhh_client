// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Status> _$statusSerializer = new _$StatusSerializer();

class _$StatusSerializer implements StructuredSerializer<Status> {
  @override
  final Iterable<Type> types = const [Status, _$Status];
  @override
  final String wireName = 'Status';

  @override
  Iterable<Object> serialize(Serializers serializers, Status object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'character_id',
      serializers.serialize(object.characterId,
          specifiedType: const FullType(int)),
      'image_url',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'is_status_now',
      serializers.serialize(object.isStatusNow,
          specifiedType: const FullType(bool)),
    ];
    if (object.code != null) {
      result
        ..add('code')
        ..add(serializers.serialize(object.code,
            specifiedType: const FullType(int)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Status deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'character_id':
          result.characterId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'image_url':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_status_now':
          result.isStatusNow = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Status extends Status {
  @override
  final int code;
  @override
  final int characterId;
  @override
  final String imageUrl;
  @override
  final String description;
  @override
  final bool isStatusNow;

  factory _$Status([void Function(StatusBuilder) updates]) =>
      (new StatusBuilder()..update(updates)).build();

  _$Status._(
      {this.code,
      this.characterId,
      this.imageUrl,
      this.description,
      this.isStatusNow})
      : super._() {
    if (characterId == null) {
      throw new BuiltValueNullFieldError('Status', 'characterId');
    }
    if (imageUrl == null) {
      throw new BuiltValueNullFieldError('Status', 'imageUrl');
    }
    if (isStatusNow == null) {
      throw new BuiltValueNullFieldError('Status', 'isStatusNow');
    }
  }

  @override
  Status rebuild(void Function(StatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusBuilder toBuilder() => new StatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Status &&
        code == other.code &&
        characterId == other.characterId &&
        imageUrl == other.imageUrl &&
        description == other.description &&
        isStatusNow == other.isStatusNow;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, code.hashCode), characterId.hashCode),
                imageUrl.hashCode),
            description.hashCode),
        isStatusNow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Status')
          ..add('code', code)
          ..add('characterId', characterId)
          ..add('imageUrl', imageUrl)
          ..add('description', description)
          ..add('isStatusNow', isStatusNow))
        .toString();
  }
}

class StatusBuilder implements Builder<Status, StatusBuilder> {
  _$Status _$v;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  int _characterId;
  int get characterId => _$this._characterId;
  set characterId(int characterId) => _$this._characterId = characterId;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _isStatusNow;
  bool get isStatusNow => _$this._isStatusNow;
  set isStatusNow(bool isStatusNow) => _$this._isStatusNow = isStatusNow;

  StatusBuilder();

  StatusBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _characterId = _$v.characterId;
      _imageUrl = _$v.imageUrl;
      _description = _$v.description;
      _isStatusNow = _$v.isStatusNow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Status other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Status;
  }

  @override
  void update(void Function(StatusBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Status build() {
    final _$result = _$v ??
        new _$Status._(
            code: code,
            characterId: characterId,
            imageUrl: imageUrl,
            description: description,
            isStatusNow: isStatusNow);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
