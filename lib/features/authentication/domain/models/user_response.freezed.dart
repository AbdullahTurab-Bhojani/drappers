// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateUserResponse {

 bool get isSuccess; UpdateUserData? get data; String get message;
/// Create a copy of UpdateUserResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserResponseCopyWith<UpdateUserResponse> get copyWith => _$UpdateUserResponseCopyWithImpl<UpdateUserResponse>(this as UpdateUserResponse, _$identity);

  /// Serializes this UpdateUserResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'UpdateUserResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $UpdateUserResponseCopyWith<$Res>  {
  factory $UpdateUserResponseCopyWith(UpdateUserResponse value, $Res Function(UpdateUserResponse) _then) = _$UpdateUserResponseCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, UpdateUserData? data, String message
});


$UpdateUserDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$UpdateUserResponseCopyWithImpl<$Res>
    implements $UpdateUserResponseCopyWith<$Res> {
  _$UpdateUserResponseCopyWithImpl(this._self, this._then);

  final UpdateUserResponse _self;
  final $Res Function(UpdateUserResponse) _then;

/// Create a copy of UpdateUserResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UpdateUserData?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of UpdateUserResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateUserDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UpdateUserDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateUserResponse].
extension UpdateUserResponsePatterns on UpdateUserResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateUserResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateUserResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateUserResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateUserResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateUserResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateUserResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  UpdateUserData? data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateUserResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  UpdateUserData? data,  String message)  $default,) {final _that = this;
switch (_that) {
case _UpdateUserResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  UpdateUserData? data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _UpdateUserResponse() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateUserResponse implements UpdateUserResponse {
  const _UpdateUserResponse({required this.isSuccess, required this.data, required this.message});
  factory _UpdateUserResponse.fromJson(Map<String, dynamic> json) => _$UpdateUserResponseFromJson(json);

@override final  bool isSuccess;
@override final  UpdateUserData? data;
@override final  String message;

/// Create a copy of UpdateUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserResponseCopyWith<_UpdateUserResponse> get copyWith => __$UpdateUserResponseCopyWithImpl<_UpdateUserResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateUserResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'UpdateUserResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserResponseCopyWith<$Res> implements $UpdateUserResponseCopyWith<$Res> {
  factory _$UpdateUserResponseCopyWith(_UpdateUserResponse value, $Res Function(_UpdateUserResponse) _then) = __$UpdateUserResponseCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, UpdateUserData? data, String message
});


@override $UpdateUserDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$UpdateUserResponseCopyWithImpl<$Res>
    implements _$UpdateUserResponseCopyWith<$Res> {
  __$UpdateUserResponseCopyWithImpl(this._self, this._then);

  final _UpdateUserResponse _self;
  final $Res Function(_UpdateUserResponse) _then;

/// Create a copy of UpdateUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_UpdateUserResponse(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UpdateUserData?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of UpdateUserResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateUserDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UpdateUserDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$UpdateUserData {

 String get firstName; String get lastName; DateTime get modifiedOn;
/// Create a copy of UpdateUserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserDataCopyWith<UpdateUserData> get copyWith => _$UpdateUserDataCopyWithImpl<UpdateUserData>(this as UpdateUserData, _$identity);

  /// Serializes this UpdateUserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserData&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,modifiedOn);

@override
String toString() {
  return 'UpdateUserData(firstName: $firstName, lastName: $lastName, modifiedOn: $modifiedOn)';
}


}

/// @nodoc
abstract mixin class $UpdateUserDataCopyWith<$Res>  {
  factory $UpdateUserDataCopyWith(UpdateUserData value, $Res Function(UpdateUserData) _then) = _$UpdateUserDataCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, DateTime modifiedOn
});




}
/// @nodoc
class _$UpdateUserDataCopyWithImpl<$Res>
    implements $UpdateUserDataCopyWith<$Res> {
  _$UpdateUserDataCopyWithImpl(this._self, this._then);

  final UpdateUserData _self;
  final $Res Function(UpdateUserData) _then;

/// Create a copy of UpdateUserData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? modifiedOn = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,modifiedOn: null == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateUserData].
extension UpdateUserDataPatterns on UpdateUserData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateUserData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateUserData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateUserData value)  $default,){
final _that = this;
switch (_that) {
case _UpdateUserData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateUserData value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateUserData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  DateTime modifiedOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateUserData() when $default != null:
return $default(_that.firstName,_that.lastName,_that.modifiedOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  DateTime modifiedOn)  $default,) {final _that = this;
switch (_that) {
case _UpdateUserData():
return $default(_that.firstName,_that.lastName,_that.modifiedOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  DateTime modifiedOn)?  $default,) {final _that = this;
switch (_that) {
case _UpdateUserData() when $default != null:
return $default(_that.firstName,_that.lastName,_that.modifiedOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateUserData implements UpdateUserData {
  const _UpdateUserData({required this.firstName, required this.lastName, required this.modifiedOn});
  factory _UpdateUserData.fromJson(Map<String, dynamic> json) => _$UpdateUserDataFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  DateTime modifiedOn;

/// Create a copy of UpdateUserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserDataCopyWith<_UpdateUserData> get copyWith => __$UpdateUserDataCopyWithImpl<_UpdateUserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateUserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserData&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,modifiedOn);

@override
String toString() {
  return 'UpdateUserData(firstName: $firstName, lastName: $lastName, modifiedOn: $modifiedOn)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserDataCopyWith<$Res> implements $UpdateUserDataCopyWith<$Res> {
  factory _$UpdateUserDataCopyWith(_UpdateUserData value, $Res Function(_UpdateUserData) _then) = __$UpdateUserDataCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, DateTime modifiedOn
});




}
/// @nodoc
class __$UpdateUserDataCopyWithImpl<$Res>
    implements _$UpdateUserDataCopyWith<$Res> {
  __$UpdateUserDataCopyWithImpl(this._self, this._then);

  final _UpdateUserData _self;
  final $Res Function(_UpdateUserData) _then;

/// Create a copy of UpdateUserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? modifiedOn = null,}) {
  return _then(_UpdateUserData(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,modifiedOn: null == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
