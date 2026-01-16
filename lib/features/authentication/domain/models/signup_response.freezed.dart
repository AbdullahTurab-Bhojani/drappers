// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpResponseDto {

 bool get isSuccess; Map<String, dynamic> get data; String get message;
/// Create a copy of SignUpResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpResponseDtoCopyWith<SignUpResponseDto> get copyWith => _$SignUpResponseDtoCopyWithImpl<SignUpResponseDto>(this as SignUpResponseDto, _$identity);

  /// Serializes this SignUpResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpResponseDto&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'SignUpResponseDto(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $SignUpResponseDtoCopyWith<$Res>  {
  factory $SignUpResponseDtoCopyWith(SignUpResponseDto value, $Res Function(SignUpResponseDto) _then) = _$SignUpResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, Map<String, dynamic> data, String message
});




}
/// @nodoc
class _$SignUpResponseDtoCopyWithImpl<$Res>
    implements $SignUpResponseDtoCopyWith<$Res> {
  _$SignUpResponseDtoCopyWithImpl(this._self, this._then);

  final SignUpResponseDto _self;
  final $Res Function(SignUpResponseDto) _then;

/// Create a copy of SignUpResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpResponseDto].
extension SignUpResponseDtoPatterns on SignUpResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _SignUpResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  Map<String, dynamic> data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpResponseDto() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  Map<String, dynamic> data,  String message)  $default,) {final _that = this;
switch (_that) {
case _SignUpResponseDto():
return $default(_that.isSuccess,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  Map<String, dynamic> data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _SignUpResponseDto() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignUpResponseDto implements SignUpResponseDto {
  const _SignUpResponseDto({required this.isSuccess, final  Map<String, dynamic> data = const {}, required this.message}): _data = data;
  factory _SignUpResponseDto.fromJson(Map<String, dynamic> json) => _$SignUpResponseDtoFromJson(json);

@override final  bool isSuccess;
 final  Map<String, dynamic> _data;
@override@JsonKey() Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

@override final  String message;

/// Create a copy of SignUpResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpResponseDtoCopyWith<_SignUpResponseDto> get copyWith => __$SignUpResponseDtoCopyWithImpl<_SignUpResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignUpResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpResponseDto&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,const DeepCollectionEquality().hash(_data),message);

@override
String toString() {
  return 'SignUpResponseDto(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SignUpResponseDtoCopyWith<$Res> implements $SignUpResponseDtoCopyWith<$Res> {
  factory _$SignUpResponseDtoCopyWith(_SignUpResponseDto value, $Res Function(_SignUpResponseDto) _then) = __$SignUpResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, Map<String, dynamic> data, String message
});




}
/// @nodoc
class __$SignUpResponseDtoCopyWithImpl<$Res>
    implements _$SignUpResponseDtoCopyWith<$Res> {
  __$SignUpResponseDtoCopyWithImpl(this._self, this._then);

  final _SignUpResponseDto _self;
  final $Res Function(_SignUpResponseDto) _then;

/// Create a copy of SignUpResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_SignUpResponseDto(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
