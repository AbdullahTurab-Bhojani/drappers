// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgetPasswordDTO {

@JsonKey(name: 'email') String get email;
/// Create a copy of ForgetPasswordDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgetPasswordDTOCopyWith<ForgetPasswordDTO> get copyWith => _$ForgetPasswordDTOCopyWithImpl<ForgetPasswordDTO>(this as ForgetPasswordDTO, _$identity);

  /// Serializes this ForgetPasswordDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordDTO&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgetPasswordDTO(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgetPasswordDTOCopyWith<$Res>  {
  factory $ForgetPasswordDTOCopyWith(ForgetPasswordDTO value, $Res Function(ForgetPasswordDTO) _then) = _$ForgetPasswordDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'email') String email
});




}
/// @nodoc
class _$ForgetPasswordDTOCopyWithImpl<$Res>
    implements $ForgetPasswordDTOCopyWith<$Res> {
  _$ForgetPasswordDTOCopyWithImpl(this._self, this._then);

  final ForgetPasswordDTO _self;
  final $Res Function(ForgetPasswordDTO) _then;

/// Create a copy of ForgetPasswordDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgetPasswordDTO].
extension ForgetPasswordDTOPatterns on ForgetPasswordDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgetPasswordDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgetPasswordDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgetPasswordDTO value)  $default,){
final _that = this;
switch (_that) {
case _ForgetPasswordDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgetPasswordDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ForgetPasswordDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'email')  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgetPasswordDTO() when $default != null:
return $default(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'email')  String email)  $default,) {final _that = this;
switch (_that) {
case _ForgetPasswordDTO():
return $default(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'email')  String email)?  $default,) {final _that = this;
switch (_that) {
case _ForgetPasswordDTO() when $default != null:
return $default(_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForgetPasswordDTO implements ForgetPasswordDTO {
  const _ForgetPasswordDTO({@JsonKey(name: 'email') required this.email});
  factory _ForgetPasswordDTO.fromJson(Map<String, dynamic> json) => _$ForgetPasswordDTOFromJson(json);

@override@JsonKey(name: 'email') final  String email;

/// Create a copy of ForgetPasswordDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgetPasswordDTOCopyWith<_ForgetPasswordDTO> get copyWith => __$ForgetPasswordDTOCopyWithImpl<_ForgetPasswordDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgetPasswordDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgetPasswordDTO&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgetPasswordDTO(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ForgetPasswordDTOCopyWith<$Res> implements $ForgetPasswordDTOCopyWith<$Res> {
  factory _$ForgetPasswordDTOCopyWith(_ForgetPasswordDTO value, $Res Function(_ForgetPasswordDTO) _then) = __$ForgetPasswordDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'email') String email
});




}
/// @nodoc
class __$ForgetPasswordDTOCopyWithImpl<$Res>
    implements _$ForgetPasswordDTOCopyWith<$Res> {
  __$ForgetPasswordDTOCopyWithImpl(this._self, this._then);

  final _ForgetPasswordDTO _self;
  final $Res Function(_ForgetPasswordDTO) _then;

/// Create a copy of ForgetPasswordDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_ForgetPasswordDTO(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
