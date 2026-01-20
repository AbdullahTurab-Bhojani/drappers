// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPasswordDTO {

@JsonKey(name: 'newPassword') String get newPassword;
/// Create a copy of ResetPasswordDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordDTOCopyWith<ResetPasswordDTO> get copyWith => _$ResetPasswordDTOCopyWithImpl<ResetPasswordDTO>(this as ResetPasswordDTO, _$identity);

  /// Serializes this ResetPasswordDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordDTO&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newPassword);

@override
String toString() {
  return 'ResetPasswordDTO(newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordDTOCopyWith<$Res>  {
  factory $ResetPasswordDTOCopyWith(ResetPasswordDTO value, $Res Function(ResetPasswordDTO) _then) = _$ResetPasswordDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'newPassword') String newPassword
});




}
/// @nodoc
class _$ResetPasswordDTOCopyWithImpl<$Res>
    implements $ResetPasswordDTOCopyWith<$Res> {
  _$ResetPasswordDTOCopyWithImpl(this._self, this._then);

  final ResetPasswordDTO _self;
  final $Res Function(ResetPasswordDTO) _then;

/// Create a copy of ResetPasswordDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newPassword = null,}) {
  return _then(_self.copyWith(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPasswordDTO].
extension ResetPasswordDTOPatterns on ResetPasswordDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPasswordDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPasswordDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPasswordDTO value)  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPasswordDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'newPassword')  String newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPasswordDTO() when $default != null:
return $default(_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'newPassword')  String newPassword)  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordDTO():
return $default(_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'newPassword')  String newPassword)?  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordDTO() when $default != null:
return $default(_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResetPasswordDTO implements ResetPasswordDTO {
  const _ResetPasswordDTO({@JsonKey(name: 'newPassword') required this.newPassword});
  factory _ResetPasswordDTO.fromJson(Map<String, dynamic> json) => _$ResetPasswordDTOFromJson(json);

@override@JsonKey(name: 'newPassword') final  String newPassword;

/// Create a copy of ResetPasswordDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordDTOCopyWith<_ResetPasswordDTO> get copyWith => __$ResetPasswordDTOCopyWithImpl<_ResetPasswordDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPasswordDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordDTO&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newPassword);

@override
String toString() {
  return 'ResetPasswordDTO(newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordDTOCopyWith<$Res> implements $ResetPasswordDTOCopyWith<$Res> {
  factory _$ResetPasswordDTOCopyWith(_ResetPasswordDTO value, $Res Function(_ResetPasswordDTO) _then) = __$ResetPasswordDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'newPassword') String newPassword
});




}
/// @nodoc
class __$ResetPasswordDTOCopyWithImpl<$Res>
    implements _$ResetPasswordDTOCopyWith<$Res> {
  __$ResetPasswordDTOCopyWithImpl(this._self, this._then);

  final _ResetPasswordDTO _self;
  final $Res Function(_ResetPasswordDTO) _then;

/// Create a copy of ResetPasswordDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newPassword = null,}) {
  return _then(_ResetPasswordDTO(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
