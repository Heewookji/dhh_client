// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Character> _$characterSerializer = new _$CharacterSerializer();

class _$CharacterSerializer implements StructuredSerializer<Character> {
  @override
  final Iterable<Type> types = const [Character, _$Character];
  @override
  final String wireName = 'Character';

  @override
  Iterable<Object> serialize(Serializers serializers, Character object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'is_home',
      serializers.serialize(object.isHome, specifiedType: const FullType(int)),
      'is_travel',
      serializers.serialize(object.isTravel,
          specifiedType: const FullType(int)),
      'is_starter',
      serializers.serialize(object.isStarter,
          specifiedType: const FullType(int)),
      'code',
      serializers.serialize(object.statusCode,
          specifiedType: const FullType(int)),
      'image_url',
      serializers.serialize(object.statusImageUrl,
          specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
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
  Character deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CharacterBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_home':
          result.isHome = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'is_travel':
          result.isTravel = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'is_starter':
          result.isStarter = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'code':
          result.statusCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'image_url':
          result.statusImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$Character extends Character {
  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int isHome;
  @override
  final int isTravel;
  @override
  final int isStarter;
  @override
  final int statusCode;
  @override
  final String statusImageUrl;
  @override
  final int color;

  factory _$Character([void Function(CharacterBuilder) updates]) =>
      (new CharacterBuilder()..update(updates)).build();

  _$Character._(
      {this.id,
      this.name,
      this.description,
      this.isHome,
      this.isTravel,
      this.isStarter,
      this.statusCode,
      this.statusImageUrl,
      this.color})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Character', 'name');
    }
    if (isHome == null) {
      throw new BuiltValueNullFieldError('Character', 'isHome');
    }
    if (isTravel == null) {
      throw new BuiltValueNullFieldError('Character', 'isTravel');
    }
    if (isStarter == null) {
      throw new BuiltValueNullFieldError('Character', 'isStarter');
    }
    if (statusCode == null) {
      throw new BuiltValueNullFieldError('Character', 'statusCode');
    }
    if (statusImageUrl == null) {
      throw new BuiltValueNullFieldError('Character', 'statusImageUrl');
    }
  }

  @override
  Character rebuild(void Function(CharacterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterBuilder toBuilder() => new CharacterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Character &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        isHome == other.isHome &&
        isTravel == other.isTravel &&
        isStarter == other.isStarter &&
        statusCode == other.statusCode &&
        statusImageUrl == other.statusImageUrl &&
        color == other.color;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), name.hashCode),
                                description.hashCode),
                            isHome.hashCode),
                        isTravel.hashCode),
                    isStarter.hashCode),
                statusCode.hashCode),
            statusImageUrl.hashCode),
        color.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Character')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('isHome', isHome)
          ..add('isTravel', isTravel)
          ..add('isStarter', isStarter)
          ..add('statusCode', statusCode)
          ..add('statusImageUrl', statusImageUrl)
          ..add('color', color))
        .toString();
  }
}

class CharacterBuilder implements Builder<Character, CharacterBuilder> {
  _$Character _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _isHome;
  int get isHome => _$this._isHome;
  set isHome(int isHome) => _$this._isHome = isHome;

  int _isTravel;
  int get isTravel => _$this._isTravel;
  set isTravel(int isTravel) => _$this._isTravel = isTravel;

  int _isStarter;
  int get isStarter => _$this._isStarter;
  set isStarter(int isStarter) => _$this._isStarter = isStarter;

  int _statusCode;
  int get statusCode => _$this._statusCode;
  set statusCode(int statusCode) => _$this._statusCode = statusCode;

  String _statusImageUrl;
  String get statusImageUrl => _$this._statusImageUrl;
  set statusImageUrl(String statusImageUrl) =>
      _$this._statusImageUrl = statusImageUrl;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  CharacterBuilder();

  CharacterBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _isHome = _$v.isHome;
      _isTravel = _$v.isTravel;
      _isStarter = _$v.isStarter;
      _statusCode = _$v.statusCode;
      _statusImageUrl = _$v.statusImageUrl;
      _color = _$v.color;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Character other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Character;
  }

  @override
  void update(void Function(CharacterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Character build() {
    final _$result = _$v ??
        new _$Character._(
            id: id,
            name: name,
            description: description,
            isHome: isHome,
            isTravel: isTravel,
            isStarter: isStarter,
            statusCode: statusCode,
            statusImageUrl: statusImageUrl,
            color: color);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
