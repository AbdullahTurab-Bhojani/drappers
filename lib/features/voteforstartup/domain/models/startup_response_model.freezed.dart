// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StartupResponse {

 bool get isSuccess; StartupModel? get data; String get message;
/// Create a copy of StartupResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartupResponseCopyWith<StartupResponse> get copyWith => _$StartupResponseCopyWithImpl<StartupResponse>(this as StartupResponse, _$identity);

  /// Serializes this StartupResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartupResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'StartupResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $StartupResponseCopyWith<$Res>  {
  factory $StartupResponseCopyWith(StartupResponse value, $Res Function(StartupResponse) _then) = _$StartupResponseCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, StartupModel? data, String message
});


$StartupModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$StartupResponseCopyWithImpl<$Res>
    implements $StartupResponseCopyWith<$Res> {
  _$StartupResponseCopyWithImpl(this._self, this._then);

  final StartupResponse _self;
  final $Res Function(StartupResponse) _then;

/// Create a copy of StartupResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as StartupModel?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of StartupResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StartupModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $StartupModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [StartupResponse].
extension StartupResponsePatterns on StartupResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartupResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartupResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartupResponse value)  $default,){
final _that = this;
switch (_that) {
case _StartupResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartupResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StartupResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  StartupModel? data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartupResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  StartupModel? data,  String message)  $default,) {final _that = this;
switch (_that) {
case _StartupResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  StartupModel? data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _StartupResponse() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StartupResponse implements StartupResponse {
  const _StartupResponse({required this.isSuccess, required this.data, required this.message});
  factory _StartupResponse.fromJson(Map<String, dynamic> json) => _$StartupResponseFromJson(json);

@override final  bool isSuccess;
@override final  StartupModel? data;
@override final  String message;

/// Create a copy of StartupResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartupResponseCopyWith<_StartupResponse> get copyWith => __$StartupResponseCopyWithImpl<_StartupResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartupResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartupResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'StartupResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$StartupResponseCopyWith<$Res> implements $StartupResponseCopyWith<$Res> {
  factory _$StartupResponseCopyWith(_StartupResponse value, $Res Function(_StartupResponse) _then) = __$StartupResponseCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, StartupModel? data, String message
});


@override $StartupModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$StartupResponseCopyWithImpl<$Res>
    implements _$StartupResponseCopyWith<$Res> {
  __$StartupResponseCopyWithImpl(this._self, this._then);

  final _StartupResponse _self;
  final $Res Function(_StartupResponse) _then;

/// Create a copy of StartupResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_StartupResponse(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as StartupModel?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of StartupResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StartupModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $StartupModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$StartupListResponse {

 bool get isSuccess; List<StartupModel>? get data; String get message;
/// Create a copy of StartupListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartupListResponseCopyWith<StartupListResponse> get copyWith => _$StartupListResponseCopyWithImpl<StartupListResponse>(this as StartupListResponse, _$identity);

  /// Serializes this StartupListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartupListResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'StartupListResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $StartupListResponseCopyWith<$Res>  {
  factory $StartupListResponseCopyWith(StartupListResponse value, $Res Function(StartupListResponse) _then) = _$StartupListResponseCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, List<StartupModel>? data, String message
});




}
/// @nodoc
class _$StartupListResponseCopyWithImpl<$Res>
    implements $StartupListResponseCopyWith<$Res> {
  _$StartupListResponseCopyWithImpl(this._self, this._then);

  final StartupListResponse _self;
  final $Res Function(StartupListResponse) _then;

/// Create a copy of StartupListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<StartupModel>?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StartupListResponse].
extension StartupListResponsePatterns on StartupListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartupListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartupListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartupListResponse value)  $default,){
final _that = this;
switch (_that) {
case _StartupListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartupListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StartupListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  List<StartupModel>? data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartupListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  List<StartupModel>? data,  String message)  $default,) {final _that = this;
switch (_that) {
case _StartupListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  List<StartupModel>? data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _StartupListResponse() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StartupListResponse implements StartupListResponse {
  const _StartupListResponse({required this.isSuccess, required final  List<StartupModel>? data, required this.message}): _data = data;
  factory _StartupListResponse.fromJson(Map<String, dynamic> json) => _$StartupListResponseFromJson(json);

@override final  bool isSuccess;
 final  List<StartupModel>? _data;
@override List<StartupModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String message;

/// Create a copy of StartupListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartupListResponseCopyWith<_StartupListResponse> get copyWith => __$StartupListResponseCopyWithImpl<_StartupListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartupListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartupListResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,const DeepCollectionEquality().hash(_data),message);

@override
String toString() {
  return 'StartupListResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$StartupListResponseCopyWith<$Res> implements $StartupListResponseCopyWith<$Res> {
  factory _$StartupListResponseCopyWith(_StartupListResponse value, $Res Function(_StartupListResponse) _then) = __$StartupListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, List<StartupModel>? data, String message
});




}
/// @nodoc
class __$StartupListResponseCopyWithImpl<$Res>
    implements _$StartupListResponseCopyWith<$Res> {
  __$StartupListResponseCopyWithImpl(this._self, this._then);

  final _StartupListResponse _self;
  final $Res Function(_StartupListResponse) _then;

/// Create a copy of StartupListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_StartupListResponse(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<StartupModel>?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
