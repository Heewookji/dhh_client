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
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'is_home',
      serializers.serialize(object.isHome, specifiedType: const FullType(bool)),
      'is_travel',
      serializers.serialize(object.isTravel,
          specifiedType: const FullType(bool)),
      'is_starter',
      serializers.serialize(object.isStarter,
          specifiedType: const FullType(bool)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
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
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_travel':
          result.isTravel = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_starter':
          result.isStarter = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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
  final bool isHome;
  @override
  final bool isTravel;
  @override
  final bool isStarter;

  factory _$Character([void Function(CharacterBuilder) updates]) =>
      (new CharacterBuilder()..update(updates)).build();

  _$Character._(
      {this.id,
      this.name,
      this.description,
      this.isHome,
      this.isTravel,
      this.isStarter})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Character', 'id');
    }
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
        isStarter == other.isStarter;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), name.hashCode),
                    description.hashCode),
                isHome.hashCode),
            isTravel.hashCode),
        isStarter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Character')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('isHome', isHome)
          ..add('isTravel', isTravel)
          ..add('isStarter', isStarter))
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

  bool _isHome;
  bool get isHome => _$this._isHome;
  set isHome(bool isHome) => _$this._isHome = isHome;

  bool _isTravel;
  bool get isTravel => _$this._isTravel;
  set isTravel(bool isTravel) => _$this._isTravel = isTravel;

  bool _isStarter;
  bool get isStarter => _$this._isStarter;
  set isStarter(bool isStarter) => _$this._isStarter = isStarter;

  CharacterBuilder();

  CharacterBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _isHome = _$v.isHome;
      _isTravel = _$v.isTravel;
      _isStarter = _$v.isStarter;
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
            isStarter: isStarter);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
