// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseResponse {

 bool get isSuccess; Map<String, dynamic> get data; String get message;
/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseResponseCopyWith<BaseResponse> get copyWith => _$BaseResponseCopyWithImpl<BaseResponse>(this as BaseResponse, _$identity);

  /// Serializes this BaseResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'BaseResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $BaseResponseCopyWith<$Res>  {
  factory $BaseResponseCopyWith(BaseResponse value, $Res Function(BaseResponse) _then) = _$BaseResponseCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, Map<String, dynamic> data, String message
});




}
/// @nodoc
class _$BaseResponseCopyWithImpl<$Res>
    implements $BaseResponseCopyWith<$Res> {
  _$BaseResponseCopyWithImpl(this._self, this._then);

  final BaseResponse _self;
  final $Res Function(BaseResponse) _then;

/// Create a copy of BaseResponse
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


/// Adds pattern-matching-related methods to [BaseResponse].
extension BaseResponsePatterns on BaseResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseResponse value)  $default,){
final _that = this;
switch (_that) {
case _BaseResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BaseResponse() when $default != null:
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
case _BaseResponse() when $default != null:
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
case _BaseResponse():
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
case _BaseResponse() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BaseResponse implements BaseResponse {
  const _BaseResponse({required this.isSuccess, required final  Map<String, dynamic> data, required this.message}): _data = data;
  factory _BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

@override final  bool isSuccess;
 final  Map<String, dynamic> _data;
@override Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

@override final  String message;

/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseResponseCopyWith<_BaseResponse> get copyWith => __$BaseResponseCopyWithImpl<_BaseResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BaseResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,const DeepCollectionEquality().hash(_data),message);

@override
String toString() {
  return 'BaseResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$BaseResponseCopyWith<$Res> implements $BaseResponseCopyWith<$Res> {
  factory _$BaseResponseCopyWith(_BaseResponse value, $Res Function(_BaseResponse) _then) = __$BaseResponseCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, Map<String, dynamic> data, String message
});




}
/// @nodoc
class __$BaseResponseCopyWithImpl<$Res>
    implements _$BaseResponseCopyWith<$Res> {
  __$BaseResponseCopyWithImpl(this._self, this._then);

  final _BaseResponse _self;
  final $Res Function(_BaseResponse) _then;

/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_BaseResponse(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
