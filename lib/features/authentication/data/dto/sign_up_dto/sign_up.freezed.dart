// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpDto {

 String get fullName; String get email; String get phoneNumber; String get password;
/// Create a copy of SignUpDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpDtoCopyWith<SignUpDto> get copyWith => _$SignUpDtoCopyWithImpl<SignUpDto>(this as SignUpDto, _$identity);

  /// Serializes this SignUpDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpDto&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,phoneNumber,password);

@override
String toString() {
  return 'SignUpDto(fullName: $fullName, email: $email, phoneNumber: $phoneNumber, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignUpDtoCopyWith<$Res>  {
  factory $SignUpDtoCopyWith(SignUpDto value, $Res Function(SignUpDto) _then) = _$SignUpDtoCopyWithImpl;
@useResult
$Res call({
 String fullName, String email, String phoneNumber, String password
});




}
/// @nodoc
class _$SignUpDtoCopyWithImpl<$Res>
    implements $SignUpDtoCopyWith<$Res> {
  _$SignUpDtoCopyWithImpl(this._self, this._then);

  final SignUpDto _self;
  final $Res Function(SignUpDto) _then;

/// Create a copy of SignUpDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? email = null,Object? phoneNumber = null,Object? password = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpDto].
extension SignUpDtoPatterns on SignUpDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpDto value)  $default,){
final _that = this;
switch (_that) {
case _SignUpDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpDto value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String email,  String phoneNumber,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpDto() when $default != null:
return $default(_that.fullName,_that.email,_that.phoneNumber,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String email,  String phoneNumber,  String password)  $default,) {final _that = this;
switch (_that) {
case _SignUpDto():
return $default(_that.fullName,_that.email,_that.phoneNumber,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String email,  String phoneNumber,  String password)?  $default,) {final _that = this;
switch (_that) {
case _SignUpDto() when $default != null:
return $default(_that.fullName,_that.email,_that.phoneNumber,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignUpDto implements SignUpDto {
  const _SignUpDto({this.fullName = '', this.email = '', this.phoneNumber = '', this.password = ''});
  factory _SignUpDto.fromJson(Map<String, dynamic> json) => _$SignUpDtoFromJson(json);

@override@JsonKey() final  String fullName;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String password;

/// Create a copy of SignUpDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpDtoCopyWith<_SignUpDto> get copyWith => __$SignUpDtoCopyWithImpl<_SignUpDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignUpDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpDto&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,phoneNumber,password);

@override
String toString() {
  return 'SignUpDto(fullName: $fullName, email: $email, phoneNumber: $phoneNumber, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SignUpDtoCopyWith<$Res> implements $SignUpDtoCopyWith<$Res> {
  factory _$SignUpDtoCopyWith(_SignUpDto value, $Res Function(_SignUpDto) _then) = __$SignUpDtoCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String email, String phoneNumber, String password
});




}
/// @nodoc
class __$SignUpDtoCopyWithImpl<$Res>
    implements _$SignUpDtoCopyWith<$Res> {
  __$SignUpDtoCopyWithImpl(this._self, this._then);

  final _SignUpDto _self;
  final $Res Function(_SignUpDto) _then;

/// Create a copy of SignUpDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? email = null,Object? phoneNumber = null,Object? password = null,}) {
  return _then(_SignUpDto(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
