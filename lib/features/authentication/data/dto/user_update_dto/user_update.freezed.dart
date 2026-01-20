// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateUserDTO {

 String get firstName; String get lastName; String get profileUrl;
/// Create a copy of UpdateUserDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserDTOCopyWith<UpdateUserDTO> get copyWith => _$UpdateUserDTOCopyWithImpl<UpdateUserDTO>(this as UpdateUserDTO, _$identity);

  /// Serializes this UpdateUserDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserDTO&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,profileUrl);

@override
String toString() {
  return 'UpdateUserDTO(firstName: $firstName, lastName: $lastName, profileUrl: $profileUrl)';
}


}

/// @nodoc
abstract mixin class $UpdateUserDTOCopyWith<$Res>  {
  factory $UpdateUserDTOCopyWith(UpdateUserDTO value, $Res Function(UpdateUserDTO) _then) = _$UpdateUserDTOCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String profileUrl
});




}
/// @nodoc
class _$UpdateUserDTOCopyWithImpl<$Res>
    implements $UpdateUserDTOCopyWith<$Res> {
  _$UpdateUserDTOCopyWithImpl(this._self, this._then);

  final UpdateUserDTO _self;
  final $Res Function(UpdateUserDTO) _then;

/// Create a copy of UpdateUserDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? profileUrl = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,profileUrl: null == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateUserDTO].
extension UpdateUserDTOPatterns on UpdateUserDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateUserDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateUserDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateUserDTO value)  $default,){
final _that = this;
switch (_that) {
case _UpdateUserDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateUserDTO value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateUserDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String profileUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateUserDTO() when $default != null:
return $default(_that.firstName,_that.lastName,_that.profileUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String profileUrl)  $default,) {final _that = this;
switch (_that) {
case _UpdateUserDTO():
return $default(_that.firstName,_that.lastName,_that.profileUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String profileUrl)?  $default,) {final _that = this;
switch (_that) {
case _UpdateUserDTO() when $default != null:
return $default(_that.firstName,_that.lastName,_that.profileUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateUserDTO implements UpdateUserDTO {
  const _UpdateUserDTO({required this.firstName, required this.lastName, required this.profileUrl});
  factory _UpdateUserDTO.fromJson(Map<String, dynamic> json) => _$UpdateUserDTOFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  String profileUrl;

/// Create a copy of UpdateUserDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserDTOCopyWith<_UpdateUserDTO> get copyWith => __$UpdateUserDTOCopyWithImpl<_UpdateUserDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateUserDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserDTO&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,profileUrl);

@override
String toString() {
  return 'UpdateUserDTO(firstName: $firstName, lastName: $lastName, profileUrl: $profileUrl)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserDTOCopyWith<$Res> implements $UpdateUserDTOCopyWith<$Res> {
  factory _$UpdateUserDTOCopyWith(_UpdateUserDTO value, $Res Function(_UpdateUserDTO) _then) = __$UpdateUserDTOCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String profileUrl
});




}
/// @nodoc
class __$UpdateUserDTOCopyWithImpl<$Res>
    implements _$UpdateUserDTOCopyWith<$Res> {
  __$UpdateUserDTOCopyWithImpl(this._self, this._then);

  final _UpdateUserDTO _self;
  final $Res Function(_UpdateUserDTO) _then;

/// Create a copy of UpdateUserDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? profileUrl = null,}) {
  return _then(_UpdateUserDTO(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,profileUrl: null == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
