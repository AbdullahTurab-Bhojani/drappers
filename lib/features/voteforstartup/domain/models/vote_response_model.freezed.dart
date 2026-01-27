// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoteResponse {

 bool get isSuccess; VoteData? get data;// nullable for "unlike" response
 String get message;
/// Create a copy of VoteResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoteResponseCopyWith<VoteResponse> get copyWith => _$VoteResponseCopyWithImpl<VoteResponse>(this as VoteResponse, _$identity);

  /// Serializes this VoteResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoteResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'VoteResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $VoteResponseCopyWith<$Res>  {
  factory $VoteResponseCopyWith(VoteResponse value, $Res Function(VoteResponse) _then) = _$VoteResponseCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, VoteData? data, String message
});


$VoteDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$VoteResponseCopyWithImpl<$Res>
    implements $VoteResponseCopyWith<$Res> {
  _$VoteResponseCopyWithImpl(this._self, this._then);

  final VoteResponse _self;
  final $Res Function(VoteResponse) _then;

/// Create a copy of VoteResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VoteData?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of VoteResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoteDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $VoteDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VoteResponse].
extension VoteResponsePatterns on VoteResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoteResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoteResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoteResponse value)  $default,){
final _that = this;
switch (_that) {
case _VoteResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoteResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VoteResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  VoteData? data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoteResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  VoteData? data,  String message)  $default,) {final _that = this;
switch (_that) {
case _VoteResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  VoteData? data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _VoteResponse() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoteResponse implements VoteResponse {
  const _VoteResponse({required this.isSuccess, this.data, required this.message});
  factory _VoteResponse.fromJson(Map<String, dynamic> json) => _$VoteResponseFromJson(json);

@override final  bool isSuccess;
@override final  VoteData? data;
// nullable for "unlike" response
@override final  String message;

/// Create a copy of VoteResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoteResponseCopyWith<_VoteResponse> get copyWith => __$VoteResponseCopyWithImpl<_VoteResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoteResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoteResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'VoteResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$VoteResponseCopyWith<$Res> implements $VoteResponseCopyWith<$Res> {
  factory _$VoteResponseCopyWith(_VoteResponse value, $Res Function(_VoteResponse) _then) = __$VoteResponseCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, VoteData? data, String message
});


@override $VoteDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$VoteResponseCopyWithImpl<$Res>
    implements _$VoteResponseCopyWith<$Res> {
  __$VoteResponseCopyWithImpl(this._self, this._then);

  final _VoteResponse _self;
  final $Res Function(_VoteResponse) _then;

/// Create a copy of VoteResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_VoteResponse(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VoteData?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of VoteResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoteDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $VoteDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VoteData {

 int get id; String get createdOn; String get modifiedOn; String get createdBy; String get modifiedBy; bool get isDeleted; String get ownerId; String get startupId; String get userName; bool get voted; String get region;
/// Create a copy of VoteData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoteDataCopyWith<VoteData> get copyWith => _$VoteDataCopyWithImpl<VoteData>(this as VoteData, _$identity);

  /// Serializes this VoteData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoteData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.startupId, startupId) || other.startupId == startupId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.voted, voted) || other.voted == voted)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdOn,modifiedOn,createdBy,modifiedBy,isDeleted,ownerId,startupId,userName,voted,region);

@override
String toString() {
  return 'VoteData(id: $id, createdOn: $createdOn, modifiedOn: $modifiedOn, createdBy: $createdBy, modifiedBy: $modifiedBy, isDeleted: $isDeleted, ownerId: $ownerId, startupId: $startupId, userName: $userName, voted: $voted, region: $region)';
}


}

/// @nodoc
abstract mixin class $VoteDataCopyWith<$Res>  {
  factory $VoteDataCopyWith(VoteData value, $Res Function(VoteData) _then) = _$VoteDataCopyWithImpl;
@useResult
$Res call({
 int id, String createdOn, String modifiedOn, String createdBy, String modifiedBy, bool isDeleted, String ownerId, String startupId, String userName, bool voted, String region
});




}
/// @nodoc
class _$VoteDataCopyWithImpl<$Res>
    implements $VoteDataCopyWith<$Res> {
  _$VoteDataCopyWithImpl(this._self, this._then);

  final VoteData _self;
  final $Res Function(VoteData) _then;

/// Create a copy of VoteData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdOn = null,Object? modifiedOn = null,Object? createdBy = null,Object? modifiedBy = null,Object? isDeleted = null,Object? ownerId = null,Object? startupId = null,Object? userName = null,Object? voted = null,Object? region = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdOn: null == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String,modifiedOn: null == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,modifiedBy: null == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,startupId: null == startupId ? _self.startupId : startupId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,voted: null == voted ? _self.voted : voted // ignore: cast_nullable_to_non_nullable
as bool,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VoteData].
extension VoteDataPatterns on VoteData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoteData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoteData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoteData value)  $default,){
final _that = this;
switch (_that) {
case _VoteData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoteData value)?  $default,){
final _that = this;
switch (_that) {
case _VoteData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String createdOn,  String modifiedOn,  String createdBy,  String modifiedBy,  bool isDeleted,  String ownerId,  String startupId,  String userName,  bool voted,  String region)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoteData() when $default != null:
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.startupId,_that.userName,_that.voted,_that.region);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String createdOn,  String modifiedOn,  String createdBy,  String modifiedBy,  bool isDeleted,  String ownerId,  String startupId,  String userName,  bool voted,  String region)  $default,) {final _that = this;
switch (_that) {
case _VoteData():
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.startupId,_that.userName,_that.voted,_that.region);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String createdOn,  String modifiedOn,  String createdBy,  String modifiedBy,  bool isDeleted,  String ownerId,  String startupId,  String userName,  bool voted,  String region)?  $default,) {final _that = this;
switch (_that) {
case _VoteData() when $default != null:
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.startupId,_that.userName,_that.voted,_that.region);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoteData implements VoteData {
  const _VoteData({required this.id, required this.createdOn, required this.modifiedOn, required this.createdBy, required this.modifiedBy, required this.isDeleted, required this.ownerId, required this.startupId, required this.userName, required this.voted, required this.region});
  factory _VoteData.fromJson(Map<String, dynamic> json) => _$VoteDataFromJson(json);

@override final  int id;
@override final  String createdOn;
@override final  String modifiedOn;
@override final  String createdBy;
@override final  String modifiedBy;
@override final  bool isDeleted;
@override final  String ownerId;
@override final  String startupId;
@override final  String userName;
@override final  bool voted;
@override final  String region;

/// Create a copy of VoteData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoteDataCopyWith<_VoteData> get copyWith => __$VoteDataCopyWithImpl<_VoteData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoteDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoteData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.startupId, startupId) || other.startupId == startupId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.voted, voted) || other.voted == voted)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdOn,modifiedOn,createdBy,modifiedBy,isDeleted,ownerId,startupId,userName,voted,region);

@override
String toString() {
  return 'VoteData(id: $id, createdOn: $createdOn, modifiedOn: $modifiedOn, createdBy: $createdBy, modifiedBy: $modifiedBy, isDeleted: $isDeleted, ownerId: $ownerId, startupId: $startupId, userName: $userName, voted: $voted, region: $region)';
}


}

/// @nodoc
abstract mixin class _$VoteDataCopyWith<$Res> implements $VoteDataCopyWith<$Res> {
  factory _$VoteDataCopyWith(_VoteData value, $Res Function(_VoteData) _then) = __$VoteDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String createdOn, String modifiedOn, String createdBy, String modifiedBy, bool isDeleted, String ownerId, String startupId, String userName, bool voted, String region
});




}
/// @nodoc
class __$VoteDataCopyWithImpl<$Res>
    implements _$VoteDataCopyWith<$Res> {
  __$VoteDataCopyWithImpl(this._self, this._then);

  final _VoteData _self;
  final $Res Function(_VoteData) _then;

/// Create a copy of VoteData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdOn = null,Object? modifiedOn = null,Object? createdBy = null,Object? modifiedBy = null,Object? isDeleted = null,Object? ownerId = null,Object? startupId = null,Object? userName = null,Object? voted = null,Object? region = null,}) {
  return _then(_VoteData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdOn: null == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String,modifiedOn: null == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,modifiedBy: null == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,startupId: null == startupId ? _self.startupId : startupId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,voted: null == voted ? _self.voted : voted // ignore: cast_nullable_to_non_nullable
as bool,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
