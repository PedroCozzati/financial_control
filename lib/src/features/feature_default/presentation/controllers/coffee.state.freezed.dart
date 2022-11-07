// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coffee.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CoffeeStateTearOff {
  const _$CoffeeStateTearOff();

  InitialState initialState() {
    return const InitialState();
  }

  CoffeeLoading getCoffeeLoading() {
    return const CoffeeLoading();
  }

  GetCoffeeSuccess getCoffeeSuccess({required CoffeeEntity coffee}) {
    return GetCoffeeSuccess(
      coffee: coffee,
    );
  }

  GetCoffeeFailure getCoffeeFailure() {
    return const GetCoffeeFailure();
  }
}

/// @nodoc
const $CoffeeState = _$CoffeeStateTearOff();

/// @nodoc
mixin _$CoffeeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() getCoffeeLoading,
    required TResult Function(CoffeeEntity coffee) getCoffeeSuccess,
    required TResult Function() getCoffeeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? getCoffeeLoading,
    TResult Function(CoffeeEntity coffee)? getCoffeeSuccess,
    TResult Function()? getCoffeeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? getCoffeeLoading,
    TResult Function(CoffeeEntity coffee)? getCoffeeSuccess,
    TResult Function()? getCoffeeFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(CoffeeLoading value) getCoffeeLoading,
    required TResult Function(GetCoffeeSuccess value) getCoffeeSuccess,
    required TResult Function(GetCoffeeFailure value) getCoffeeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CoffeeLoading value)? getCoffeeLoading,
    TResult Function(GetCoffeeSuccess value)? getCoffeeSuccess,
    TResult Function(GetCoffeeFailure value)? getCoffeeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CoffeeLoading value)? getCoffeeLoading,
    TResult Function(GetCoffeeSuccess value)? getCoffeeSuccess,
    TResult Function(GetCoffeeFailure value)? getCoffeeFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeStateCopyWith<$Res> {
  factory $CoffeeStateCopyWith(
          CoffeeState value, $Res Function(CoffeeState) then) =
      _$CoffeeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CoffeeStateCopyWithImpl<$Res> implements $CoffeeStateCopyWith<$Res> {
  _$CoffeeStateCopyWithImpl(this._value, this._then);

  final CoffeeState _value;
  // ignore: unused_field
  final $Res Function(CoffeeState) _then;
}

/// @nodoc
abstract class $InitialStateCopyWith<$Res> {
  factory $InitialStateCopyWith(
          InitialState value, $Res Function(InitialState) then) =
      _$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialStateCopyWithImpl<$Res> extends _$CoffeeStateCopyWithImpl<$Res>
    implements $InitialStateCopyWith<$Res> {
  _$InitialStateCopyWithImpl(
      InitialState _value, $Res Function(InitialState) _then)
      : super(_value, (v) => _then(v as InitialState));

  @override
  InitialState get _value => super._value as InitialState;
}

/// @nodoc

class _$InitialState implements InitialState {
  const _$InitialState();

  @override
  String toString() {
    return 'CoffeeState.initialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() getCoffeeLoading,
    required TResult Function(CoffeeEntity coffee) getCoffeeSuccess,
    required TResult Function() getCoffeeFailure,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? getCoffeeLoading,
    TResult Function(CoffeeEntity coffee)? getCoffeeSuccess,
    TResult Function()? getCoffeeFailure,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? getCoffeeLoading,
    TResult Function(CoffeeEntity coffee)? getCoffeeSuccess,
    TResult Function()? getCoffeeFailure,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(CoffeeLoading value) getCoffeeLoading,
    required TResult Function(GetCoffeeSuccess value) getCoffeeSuccess,
    required TResult Function(GetCoffeeFailure value) getCoffeeFailure,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CoffeeLoading value)? getCoffeeLoading,
    TResult Function(GetCoffeeSuccess value)? getCoffeeSuccess,
    TResult Function(GetCoffeeFailure value)? getCoffeeFailure,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CoffeeLoading value)? getCoffeeLoading,
    TResult Function(GetCoffeeSuccess value)? getCoffeeSuccess,
    TResult Function(GetCoffeeFailure value)? getCoffeeFailure,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialState implements CoffeeState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class $CoffeeLoadingCopyWith<$Res> {
  factory $CoffeeLoadingCopyWith(
          CoffeeLoading value, $Res Function(CoffeeLoading) then) =
      _$CoffeeLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CoffeeLoadingCopyWithImpl<$Res> extends _$CoffeeStateCopyWithImpl<$Res>
    implements $CoffeeLoadingCopyWith<$Res> {
  _$CoffeeLoadingCopyWithImpl(
      CoffeeLoading _value, $Res Function(CoffeeLoading) _then)
      : super(_value, (v) => _then(v as CoffeeLoading));

  @override
  CoffeeLoading get _value => super._value as CoffeeLoading;
}

/// @nodoc

class _$CoffeeLoading implements CoffeeLoading {
  const _$CoffeeLoading();

  @override
  String toString() {
    return 'CoffeeState.getCoffeeLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CoffeeLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() getCoffeeLoading,
    required TResult Function(CoffeeEntity coffee) getCoffeeSuccess,
    required TResult Function() getCoffeeFailure,
  }) {
    return getCoffeeLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? getCoffeeLoading,
    TResult Function(CoffeeEntity coffee)? getCoffeeSuccess,
    TResult Function()? getCoffeeFailure,
  }) {
    return getCoffeeLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? getCoffeeLoading,
    TResult Function(CoffeeEntity coffee)? getCoffeeSuccess,
    TResult Function()? getCoffeeFailure,
    required TResult orElse(),
  }) {
    if (getCoffeeLoading != null) {
      return getCoffeeLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(CoffeeLoading value) getCoffeeLoading,
    required TResult Function(GetCoffeeSuccess value) getCoffeeSuccess,
    required TResult Function(GetCoffeeFailure value) getCoffeeFailure,
  }) {
    return getCoffeeLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CoffeeLoading value)? getCoffeeLoading,
    TResult Function(GetCoffeeSuccess value)? getCoffeeSuccess,
    TResult Function(GetCoffeeFailure value)? getCoffeeFailure,
  }) {
    return getCoffeeLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CoffeeLoading value)? getCoffeeLoading,
    TResult Function(GetCoffeeSuccess value)? getCoffeeSuccess,
    TResult Function(GetCoffeeFailure value)? getCoffeeFailure,
    required TResult orElse(),
  }) {
    if (getCoffeeLoading != null) {
      return getCoffeeLoading(this);
    }
    return orElse();
  }
}

abstract class CoffeeLoading implements CoffeeState {
  const factory CoffeeLoading() = _$CoffeeLoading;
}

/// @nodoc
abstract class $GetCoffeeSuccessCopyWith<$Res> {
  factory $GetCoffeeSuccessCopyWith(
          GetCoffeeSuccess value, $Res Function(GetCoffeeSuccess) then) =
      _$GetCoffeeSuccessCopyWithImpl<$Res>;
  $Res call({CoffeeEntity coffee});
}

/// @nodoc
class _$GetCoffeeSuccessCopyWithImpl<$Res>
    extends _$CoffeeStateCopyWithImpl<$Res>
    implements $GetCoffeeSuccessCopyWith<$Res> {
  _$GetCoffeeSuccessCopyWithImpl(
      GetCoffeeSuccess _value, $Res Function(GetCoffeeSuccess) _then)
      : super(_value, (v) => _then(v as GetCoffeeSuccess));

  @override
  GetCoffeeSuccess get _value => super._value as GetCoffeeSuccess;

  @override
  $Res call({
    Object? coffee = freezed,
  }) {
    return _then(GetCoffeeSuccess(
      coffee: coffee == freezed
          ? _value.coffee
          : coffee // ignore: cast_nullable_to_non_nullable
              as CoffeeEntity,
    ));
  }
}

/// @nodoc

class _$GetCoffeeSuccess implements GetCoffeeSuccess {
  const _$GetCoffeeSuccess({required this.coffee});

  @override
  final CoffeeEntity coffee;

  @override
  String toString() {
    return 'CoffeeState.getCoffeeSuccess(coffee: $coffee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetCoffeeSuccess &&
            const DeepCollectionEquality().equals(other.coffee, coffee));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(coffee));

  @JsonKey(ignore: true)
  @override
  $GetCoffeeSuccessCopyWith<GetCoffeeSuccess> get copyWith =>
      _$GetCoffeeSuccessCopyWithImpl<GetCoffeeSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() getCoffeeLoading,
    required TResult Function(CoffeeEntity coffee) getCoffeeSuccess,
    required TResult Function() getCoffeeFailure,
  }) {
    return getCoffeeSuccess(coffee);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? getCoffeeLoading,
    TResult Function(CoffeeEntity coffee)? getCoffeeSuccess,
    TResult Function()? getCoffeeFailure,
  }) {
    return getCoffeeSuccess?.call(coffee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? getCoffeeLoading,
    TResult Function(CoffeeEntity coffee)? getCoffeeSuccess,
    TResult Function()? getCoffeeFailure,
    required TResult orElse(),
  }) {
    if (getCoffeeSuccess != null) {
      return getCoffeeSuccess(coffee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(CoffeeLoading value) getCoffeeLoading,
    required TResult Function(GetCoffeeSuccess value) getCoffeeSuccess,
    required TResult Function(GetCoffeeFailure value) getCoffeeFailure,
  }) {
    return getCoffeeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CoffeeLoading value)? getCoffeeLoading,
    TResult Function(GetCoffeeSuccess value)? getCoffeeSuccess,
    TResult Function(GetCoffeeFailure value)? getCoffeeFailure,
  }) {
    return getCoffeeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CoffeeLoading value)? getCoffeeLoading,
    TResult Function(GetCoffeeSuccess value)? getCoffeeSuccess,
    TResult Function(GetCoffeeFailure value)? getCoffeeFailure,
    required TResult orElse(),
  }) {
    if (getCoffeeSuccess != null) {
      return getCoffeeSuccess(this);
    }
    return orElse();
  }
}

abstract class GetCoffeeSuccess implements CoffeeState {
  const factory GetCoffeeSuccess({required CoffeeEntity coffee}) =
      _$GetCoffeeSuccess;

  CoffeeEntity get coffee;
  @JsonKey(ignore: true)
  $GetCoffeeSuccessCopyWith<GetCoffeeSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCoffeeFailureCopyWith<$Res> {
  factory $GetCoffeeFailureCopyWith(
          GetCoffeeFailure value, $Res Function(GetCoffeeFailure) then) =
      _$GetCoffeeFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetCoffeeFailureCopyWithImpl<$Res>
    extends _$CoffeeStateCopyWithImpl<$Res>
    implements $GetCoffeeFailureCopyWith<$Res> {
  _$GetCoffeeFailureCopyWithImpl(
      GetCoffeeFailure _value, $Res Function(GetCoffeeFailure) _then)
      : super(_value, (v) => _then(v as GetCoffeeFailure));

  @override
  GetCoffeeFailure get _value => super._value as GetCoffeeFailure;
}

/// @nodoc

class _$GetCoffeeFailure implements GetCoffeeFailure {
  const _$GetCoffeeFailure();

  @override
  String toString() {
    return 'CoffeeState.getCoffeeFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetCoffeeFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() getCoffeeLoading,
    required TResult Function(CoffeeEntity coffee) getCoffeeSuccess,
    required TResult Function() getCoffeeFailure,
  }) {
    return getCoffeeFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? getCoffeeLoading,
    TResult Function(CoffeeEntity coffee)? getCoffeeSuccess,
    TResult Function()? getCoffeeFailure,
  }) {
    return getCoffeeFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? getCoffeeLoading,
    TResult Function(CoffeeEntity coffee)? getCoffeeSuccess,
    TResult Function()? getCoffeeFailure,
    required TResult orElse(),
  }) {
    if (getCoffeeFailure != null) {
      return getCoffeeFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(CoffeeLoading value) getCoffeeLoading,
    required TResult Function(GetCoffeeSuccess value) getCoffeeSuccess,
    required TResult Function(GetCoffeeFailure value) getCoffeeFailure,
  }) {
    return getCoffeeFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CoffeeLoading value)? getCoffeeLoading,
    TResult Function(GetCoffeeSuccess value)? getCoffeeSuccess,
    TResult Function(GetCoffeeFailure value)? getCoffeeFailure,
  }) {
    return getCoffeeFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CoffeeLoading value)? getCoffeeLoading,
    TResult Function(GetCoffeeSuccess value)? getCoffeeSuccess,
    TResult Function(GetCoffeeFailure value)? getCoffeeFailure,
    required TResult orElse(),
  }) {
    if (getCoffeeFailure != null) {
      return getCoffeeFailure(this);
    }
    return orElse();
  }
}

abstract class GetCoffeeFailure implements CoffeeState {
  const factory GetCoffeeFailure() = _$GetCoffeeFailure;
}
