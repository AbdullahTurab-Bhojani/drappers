// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomThemeState {

 AppThemeType get theme; ThemeData get themeData; ThemeMode get themeMode;
/// Create a copy of CustomThemeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomThemeStateCopyWith<CustomThemeState> get copyWith => _$CustomThemeStateCopyWithImpl<CustomThemeState>(this as CustomThemeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomThemeState&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.themeData, themeData) || other.themeData == themeData)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,theme,themeData,themeMode);

@override
String toString() {
  return 'CustomThemeState(theme: $theme, themeData: $themeData, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $CustomThemeStateCopyWith<$Res>  {
  factory $CustomThemeStateCopyWith(CustomThemeState value, $Res Function(CustomThemeState) _then) = _$CustomThemeStateCopyWithImpl;
@useResult
$Res call({
 AppThemeType theme, ThemeData themeData, ThemeMode themeMode
});




}
/// @nodoc
class _$CustomThemeStateCopyWithImpl<$Res>
    implements $CustomThemeStateCopyWith<$Res> {
  _$CustomThemeStateCopyWithImpl(this._self, this._then);

  final CustomThemeState _self;
  final $Res Function(CustomThemeState) _then;

/// Create a copy of CustomThemeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theme = null,Object? themeData = null,Object? themeMode = null,}) {
  return _then(_self.copyWith(
theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppThemeType,themeData: null == themeData ? _self.themeData : themeData // ignore: cast_nullable_to_non_nullable
as ThemeData,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomThemeState].
extension CustomThemeStatePatterns on CustomThemeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomThemeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomThemeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomThemeState value)  $default,){
final _that = this;
switch (_that) {
case _CustomThemeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomThemeState value)?  $default,){
final _that = this;
switch (_that) {
case _CustomThemeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppThemeType theme,  ThemeData themeData,  ThemeMode themeMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomThemeState() when $default != null:
return $default(_that.theme,_that.themeData,_that.themeMode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppThemeType theme,  ThemeData themeData,  ThemeMode themeMode)  $default,) {final _that = this;
switch (_that) {
case _CustomThemeState():
return $default(_that.theme,_that.themeData,_that.themeMode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppThemeType theme,  ThemeData themeData,  ThemeMode themeMode)?  $default,) {final _that = this;
switch (_that) {
case _CustomThemeState() when $default != null:
return $default(_that.theme,_that.themeData,_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc


class _CustomThemeState implements CustomThemeState {
  const _CustomThemeState({required this.theme, required this.themeData, required this.themeMode});
  

@override final  AppThemeType theme;
@override final  ThemeData themeData;
@override final  ThemeMode themeMode;

/// Create a copy of CustomThemeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomThemeStateCopyWith<_CustomThemeState> get copyWith => __$CustomThemeStateCopyWithImpl<_CustomThemeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomThemeState&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.themeData, themeData) || other.themeData == themeData)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,theme,themeData,themeMode);

@override
String toString() {
  return 'CustomThemeState(theme: $theme, themeData: $themeData, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$CustomThemeStateCopyWith<$Res> implements $CustomThemeStateCopyWith<$Res> {
  factory _$CustomThemeStateCopyWith(_CustomThemeState value, $Res Function(_CustomThemeState) _then) = __$CustomThemeStateCopyWithImpl;
@override @useResult
$Res call({
 AppThemeType theme, ThemeData themeData, ThemeMode themeMode
});




}
/// @nodoc
class __$CustomThemeStateCopyWithImpl<$Res>
    implements _$CustomThemeStateCopyWith<$Res> {
  __$CustomThemeStateCopyWithImpl(this._self, this._then);

  final _CustomThemeState _self;
  final $Res Function(_CustomThemeState) _then;

/// Create a copy of CustomThemeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? theme = null,Object? themeData = null,Object? themeMode = null,}) {
  return _then(_CustomThemeState(
theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppThemeType,themeData: null == themeData ? _self.themeData : themeData // ignore: cast_nullable_to_non_nullable
as ThemeData,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

// dart format on
