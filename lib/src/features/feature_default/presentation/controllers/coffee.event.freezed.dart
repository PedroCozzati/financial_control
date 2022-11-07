// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coffee.event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CoffeeEventTearOff {
  const _$CoffeeEventTearOff();

  GetCoffee getCoffee() {
    return const GetCoffee();
  }
}

/// @nodoc
const $CoffeeEvent = _$CoffeeEventTearOff();

/// @nodoc
mixin _$CoffeeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCoffee,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getCoffee,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCoffee,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCoffee value) getCoffee,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetCoffee value)? getCoffee,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCoffee value)? getCoffee,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeEventCopyWith<$Res> {
  factory $CoffeeEventCopyWith(
          CoffeeEvent value, $Res Function(CoffeeEvent) then) =
      _$CoffeeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CoffeeEventCopyWithImpl<$Res> implements $CoffeeEventCopyWith<$Res> {
  _$CoffeeEventCopyWithImpl(this._value, this._then);

  final CoffeeEvent _value;
  // ignore: unused_field
  final $Res Function(CoffeeEvent) _then;
}

/// @nodoc
abstract class $GetCoffeeCopyWith<$Res> {
  factory $GetCoffeeCopyWith(GetCoffee value, $Res Function(GetCoffee) then) =
      _$GetCoffeeCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetCoffeeCopyWithImpl<$Res> extends _$CoffeeEventCopyWithImpl<$Res>
    implements $GetCoffeeCopyWith<$Res> {
  _$GetCoffeeCopyWithImpl(GetCoffee _value, $Res Function(GetCoffee) _then)
      : super(_value, (v) => _then(v as GetCoffee));

  @override
  GetCoffee get _value => super._value as GetCoffee;
}

/// @nodoc

class _$GetCoffee implements GetCoffee {
  const _$GetCoffee();

  @override
  String toString() {
    return 'CoffeeEvent.getCoffee()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetCoffee);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCoffee,
  }) {
    return getCoffee();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getCoffee,
  }) {
    return getCoffee?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCoffee,
    required TResult orElse(),
  }) {
    if (getCoffee != null) {
      return getCoffee();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCoffee value) getCoffee,
  }) {
    return getCoffee(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetCoffee value)? getCoffee,
  }) {
    return getCoffee?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCoffee value)? getCoffee,
    required TResult orElse(),
  }) {
    if (getCoffee != null) {
      return getCoffee(this);
    }
    return orElse();
  }
}

abstract class GetCoffee implements CoffeeEvent {
  const factory GetCoffee() = _$GetCoffee;
}
