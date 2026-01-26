// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteUserResponse {

 bool get isSuccess; List<dynamic> get data; String get message;
/// Create a copy of DeleteUserResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteUserResponseCopyWith<DeleteUserResponse> get copyWith => _$DeleteUserResponseCopyWithImpl<DeleteUserResponse>(this as DeleteUserResponse, _$identity);

  /// Serializes this DeleteUserResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUserResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'DeleteUserResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $DeleteUserResponseCopyWith<$Res>  {
  factory $DeleteUserResponseCopyWith(DeleteUserResponse value, $Res Function(DeleteUserResponse) _then) = _$DeleteUserResponseCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, List<dynamic> data, String message
});




}
/// @nodoc
class _$DeleteUserResponseCopyWithImpl<$Res>
    implements $DeleteUserResponseCopyWith<$Res> {
  _$DeleteUserResponseCopyWithImpl(this._self, this._then);

  final DeleteUserResponse _self;
  final $Res Function(DeleteUserResponse) _then;

/// Create a copy of DeleteUserResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteUserResponse].
extension DeleteUserResponsePatterns on DeleteUserResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteUserResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteUserResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteUserResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeleteUserResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteUserResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteUserResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  List<dynamic> data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteUserResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  List<dynamic> data,  String message)  $default,) {final _that = this;
switch (_that) {
case _DeleteUserResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  List<dynamic> data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _DeleteUserResponse() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteUserResponse implements DeleteUserResponse {
  const _DeleteUserResponse({required this.isSuccess, required final  List<dynamic> data, required this.message}): _data = data;
  factory _DeleteUserResponse.fromJson(Map<String, dynamic> json) => _$DeleteUserResponseFromJson(json);

@override final  bool isSuccess;
 final  List<dynamic> _data;
@override List<dynamic> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  String message;

/// Create a copy of DeleteUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteUserResponseCopyWith<_DeleteUserResponse> get copyWith => __$DeleteUserResponseCopyWithImpl<_DeleteUserResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteUserResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteUserResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,const DeepCollectionEquality().hash(_data),message);

@override
String toString() {
  return 'DeleteUserResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$DeleteUserResponseCopyWith<$Res> implements $DeleteUserResponseCopyWith<$Res> {
  factory _$DeleteUserResponseCopyWith(_DeleteUserResponse value, $Res Function(_DeleteUserResponse) _then) = __$DeleteUserResponseCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, List<dynamic> data, String message
});




}
/// @nodoc
class __$DeleteUserResponseCopyWithImpl<$Res>
    implements _$DeleteUserResponseCopyWith<$Res> {
  __$DeleteUserResponseCopyWithImpl(this._self, this._then);

  final _DeleteUserResponse _self;
  final $Res Function(_DeleteUserResponse) _then;

/// Create a copy of DeleteUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_DeleteUserResponse(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
