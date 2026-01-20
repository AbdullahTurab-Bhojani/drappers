// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogoutDTO {

@JsonKey(name: 'refreshToken') String get refreshToken;
/// Create a copy of LogoutDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutDTOCopyWith<LogoutDTO> get copyWith => _$LogoutDTOCopyWithImpl<LogoutDTO>(this as LogoutDTO, _$identity);

  /// Serializes this LogoutDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutDTO&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'LogoutDTO(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $LogoutDTOCopyWith<$Res>  {
  factory $LogoutDTOCopyWith(LogoutDTO value, $Res Function(LogoutDTO) _then) = _$LogoutDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'refreshToken') String refreshToken
});




}
/// @nodoc
class _$LogoutDTOCopyWithImpl<$Res>
    implements $LogoutDTOCopyWith<$Res> {
  _$LogoutDTOCopyWithImpl(this._self, this._then);

  final LogoutDTO _self;
  final $Res Function(LogoutDTO) _then;

/// Create a copy of LogoutDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refreshToken = null,}) {
  return _then(_self.copyWith(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutDTO].
extension LogoutDTOPatterns on LogoutDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogoutDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogoutDTO value)  $default,){
final _that = this;
switch (_that) {
case _LogoutDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogoutDTO value)?  $default,){
final _that = this;
switch (_that) {
case _LogoutDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'refreshToken')  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutDTO() when $default != null:
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'refreshToken')  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _LogoutDTO():
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'refreshToken')  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _LogoutDTO() when $default != null:
return $default(_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogoutDTO implements LogoutDTO {
  const _LogoutDTO({@JsonKey(name: 'refreshToken') required this.refreshToken});
  factory _LogoutDTO.fromJson(Map<String, dynamic> json) => _$LogoutDTOFromJson(json);

@override@JsonKey(name: 'refreshToken') final  String refreshToken;

/// Create a copy of LogoutDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutDTOCopyWith<_LogoutDTO> get copyWith => __$LogoutDTOCopyWithImpl<_LogoutDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutDTO&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'LogoutDTO(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$LogoutDTOCopyWith<$Res> implements $LogoutDTOCopyWith<$Res> {
  factory _$LogoutDTOCopyWith(_LogoutDTO value, $Res Function(_LogoutDTO) _then) = __$LogoutDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'refreshToken') String refreshToken
});




}
/// @nodoc
class __$LogoutDTOCopyWithImpl<$Res>
    implements _$LogoutDTOCopyWith<$Res> {
  __$LogoutDTOCopyWithImpl(this._self, this._then);

  final _LogoutDTO _self;
  final $Res Function(_LogoutDTO) _then;

/// Create a copy of LogoutDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,}) {
  return _then(_LogoutDTO(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
