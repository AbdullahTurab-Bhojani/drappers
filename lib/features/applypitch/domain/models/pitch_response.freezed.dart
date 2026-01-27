// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pitch_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PitchResponseModel {

 bool get isSuccess; PitchData? get data; String get message;
/// Create a copy of PitchResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PitchResponseModelCopyWith<PitchResponseModel> get copyWith => _$PitchResponseModelCopyWithImpl<PitchResponseModel>(this as PitchResponseModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PitchResponseModel&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'PitchResponseModel(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $PitchResponseModelCopyWith<$Res>  {
  factory $PitchResponseModelCopyWith(PitchResponseModel value, $Res Function(PitchResponseModel) _then) = _$PitchResponseModelCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, PitchData? data, String message
});


$PitchDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$PitchResponseModelCopyWithImpl<$Res>
    implements $PitchResponseModelCopyWith<$Res> {
  _$PitchResponseModelCopyWithImpl(this._self, this._then);

  final PitchResponseModel _self;
  final $Res Function(PitchResponseModel) _then;

/// Create a copy of PitchResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PitchData?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PitchResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PitchDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PitchDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PitchResponseModel].
extension PitchResponseModelPatterns on PitchResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PitchResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PitchResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PitchResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _PitchResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PitchResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PitchResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  PitchData? data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PitchResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  PitchData? data,  String message)  $default,) {final _that = this;
switch (_that) {
case _PitchResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  PitchData? data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _PitchResponseModel() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PitchResponseModel implements PitchResponseModel {
  const _PitchResponseModel({required this.isSuccess, this.data, required this.message});
  

@override final  bool isSuccess;
@override final  PitchData? data;
@override final  String message;

/// Create a copy of PitchResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PitchResponseModelCopyWith<_PitchResponseModel> get copyWith => __$PitchResponseModelCopyWithImpl<_PitchResponseModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PitchResponseModel&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'PitchResponseModel(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$PitchResponseModelCopyWith<$Res> implements $PitchResponseModelCopyWith<$Res> {
  factory _$PitchResponseModelCopyWith(_PitchResponseModel value, $Res Function(_PitchResponseModel) _then) = __$PitchResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, PitchData? data, String message
});


@override $PitchDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$PitchResponseModelCopyWithImpl<$Res>
    implements _$PitchResponseModelCopyWith<$Res> {
  __$PitchResponseModelCopyWithImpl(this._self, this._then);

  final _PitchResponseModel _self;
  final $Res Function(_PitchResponseModel) _then;

/// Create a copy of PitchResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_PitchResponseModel(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PitchData?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PitchResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PitchDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PitchDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$PitchData {

 int get id; DateTime get createdOn; DateTime get modifiedOn; String get createdBy; String get modifiedBy; bool get isDeleted; String get ownerId; String get fullName; String get startUpName; String get email; String get link; String get address; String get status;
/// Create a copy of PitchData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PitchDataCopyWith<PitchData> get copyWith => _$PitchDataCopyWithImpl<PitchData>(this as PitchData, _$identity);

  /// Serializes this PitchData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PitchData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.startUpName, startUpName) || other.startUpName == startUpName)&&(identical(other.email, email) || other.email == email)&&(identical(other.link, link) || other.link == link)&&(identical(other.address, address) || other.address == address)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdOn,modifiedOn,createdBy,modifiedBy,isDeleted,ownerId,fullName,startUpName,email,link,address,status);

@override
String toString() {
  return 'PitchData(id: $id, createdOn: $createdOn, modifiedOn: $modifiedOn, createdBy: $createdBy, modifiedBy: $modifiedBy, isDeleted: $isDeleted, ownerId: $ownerId, fullName: $fullName, startUpName: $startUpName, email: $email, link: $link, address: $address, status: $status)';
}


}

/// @nodoc
abstract mixin class $PitchDataCopyWith<$Res>  {
  factory $PitchDataCopyWith(PitchData value, $Res Function(PitchData) _then) = _$PitchDataCopyWithImpl;
@useResult
$Res call({
 int id, DateTime createdOn, DateTime modifiedOn, String createdBy, String modifiedBy, bool isDeleted, String ownerId, String fullName, String startUpName, String email, String link, String address, String status
});




}
/// @nodoc
class _$PitchDataCopyWithImpl<$Res>
    implements $PitchDataCopyWith<$Res> {
  _$PitchDataCopyWithImpl(this._self, this._then);

  final PitchData _self;
  final $Res Function(PitchData) _then;

/// Create a copy of PitchData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdOn = null,Object? modifiedOn = null,Object? createdBy = null,Object? modifiedBy = null,Object? isDeleted = null,Object? ownerId = null,Object? fullName = null,Object? startUpName = null,Object? email = null,Object? link = null,Object? address = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdOn: null == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedOn: null == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,modifiedBy: null == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,startUpName: null == startUpName ? _self.startUpName : startUpName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PitchData].
extension PitchDataPatterns on PitchData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PitchData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PitchData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PitchData value)  $default,){
final _that = this;
switch (_that) {
case _PitchData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PitchData value)?  $default,){
final _that = this;
switch (_that) {
case _PitchData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime createdOn,  DateTime modifiedOn,  String createdBy,  String modifiedBy,  bool isDeleted,  String ownerId,  String fullName,  String startUpName,  String email,  String link,  String address,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PitchData() when $default != null:
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.fullName,_that.startUpName,_that.email,_that.link,_that.address,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime createdOn,  DateTime modifiedOn,  String createdBy,  String modifiedBy,  bool isDeleted,  String ownerId,  String fullName,  String startUpName,  String email,  String link,  String address,  String status)  $default,) {final _that = this;
switch (_that) {
case _PitchData():
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.fullName,_that.startUpName,_that.email,_that.link,_that.address,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime createdOn,  DateTime modifiedOn,  String createdBy,  String modifiedBy,  bool isDeleted,  String ownerId,  String fullName,  String startUpName,  String email,  String link,  String address,  String status)?  $default,) {final _that = this;
switch (_that) {
case _PitchData() when $default != null:
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.fullName,_that.startUpName,_that.email,_that.link,_that.address,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PitchData implements PitchData {
  const _PitchData({required this.id, required this.createdOn, required this.modifiedOn, required this.createdBy, required this.modifiedBy, required this.isDeleted, required this.ownerId, required this.fullName, required this.startUpName, required this.email, required this.link, required this.address, required this.status});
  factory _PitchData.fromJson(Map<String, dynamic> json) => _$PitchDataFromJson(json);

@override final  int id;
@override final  DateTime createdOn;
@override final  DateTime modifiedOn;
@override final  String createdBy;
@override final  String modifiedBy;
@override final  bool isDeleted;
@override final  String ownerId;
@override final  String fullName;
@override final  String startUpName;
@override final  String email;
@override final  String link;
@override final  String address;
@override final  String status;

/// Create a copy of PitchData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PitchDataCopyWith<_PitchData> get copyWith => __$PitchDataCopyWithImpl<_PitchData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PitchDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PitchData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.startUpName, startUpName) || other.startUpName == startUpName)&&(identical(other.email, email) || other.email == email)&&(identical(other.link, link) || other.link == link)&&(identical(other.address, address) || other.address == address)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdOn,modifiedOn,createdBy,modifiedBy,isDeleted,ownerId,fullName,startUpName,email,link,address,status);

@override
String toString() {
  return 'PitchData(id: $id, createdOn: $createdOn, modifiedOn: $modifiedOn, createdBy: $createdBy, modifiedBy: $modifiedBy, isDeleted: $isDeleted, ownerId: $ownerId, fullName: $fullName, startUpName: $startUpName, email: $email, link: $link, address: $address, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PitchDataCopyWith<$Res> implements $PitchDataCopyWith<$Res> {
  factory _$PitchDataCopyWith(_PitchData value, $Res Function(_PitchData) _then) = __$PitchDataCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime createdOn, DateTime modifiedOn, String createdBy, String modifiedBy, bool isDeleted, String ownerId, String fullName, String startUpName, String email, String link, String address, String status
});




}
/// @nodoc
class __$PitchDataCopyWithImpl<$Res>
    implements _$PitchDataCopyWith<$Res> {
  __$PitchDataCopyWithImpl(this._self, this._then);

  final _PitchData _self;
  final $Res Function(_PitchData) _then;

/// Create a copy of PitchData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdOn = null,Object? modifiedOn = null,Object? createdBy = null,Object? modifiedBy = null,Object? isDeleted = null,Object? ownerId = null,Object? fullName = null,Object? startUpName = null,Object? email = null,Object? link = null,Object? address = null,Object? status = null,}) {
  return _then(_PitchData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdOn: null == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedOn: null == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,modifiedBy: null == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,startUpName: null == startUpName ? _self.startUpName : startUpName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
