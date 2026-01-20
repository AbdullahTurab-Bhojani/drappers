// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 bool get isSuccess; UserData? get data; String get message;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'UserModel(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, UserData? data, String message
});


$UserDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserData?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  UserData? data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  UserData? data,  String message)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  UserData? data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({this.isSuccess = false, this.data, this.message = ''});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey() final  bool isSuccess;
@override final  UserData? data;
@override@JsonKey() final  String message;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'UserModel(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, UserData? data, String message
});


@override $UserDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = freezed,Object? message = null,}) {
  return _then(_UserModel(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserData?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UserDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$UserData {

 int get id; String? get createdOn; String? get modifiedOn; String? get createdBy; String? get modifiedBy; bool get isDeleted; String? get ownerId; String? get firstName; String? get lastName; String? get fullName; String? get email; String? get phoneNumber; String? get password; String? get keycloakUserId; String? get type; List<dynamic> get addresses; List<dynamic> get recentlySessions; List<dynamic> get allSessions; int get totalSessions; String? get profileUrl;
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataCopyWith<UserData> get copyWith => _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password)&&(identical(other.keycloakUserId, keycloakUserId) || other.keycloakUserId == keycloakUserId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.addresses, addresses)&&const DeepCollectionEquality().equals(other.recentlySessions, recentlySessions)&&const DeepCollectionEquality().equals(other.allSessions, allSessions)&&(identical(other.totalSessions, totalSessions) || other.totalSessions == totalSessions)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdOn,modifiedOn,createdBy,modifiedBy,isDeleted,ownerId,firstName,lastName,fullName,email,phoneNumber,password,keycloakUserId,type,const DeepCollectionEquality().hash(addresses),const DeepCollectionEquality().hash(recentlySessions),const DeepCollectionEquality().hash(allSessions),totalSessions,profileUrl]);

@override
String toString() {
  return 'UserData(id: $id, createdOn: $createdOn, modifiedOn: $modifiedOn, createdBy: $createdBy, modifiedBy: $modifiedBy, isDeleted: $isDeleted, ownerId: $ownerId, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, password: $password, keycloakUserId: $keycloakUserId, type: $type, addresses: $addresses, recentlySessions: $recentlySessions, allSessions: $allSessions, totalSessions: $totalSessions, profileUrl: $profileUrl)';
}


}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res>  {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) = _$UserDataCopyWithImpl;
@useResult
$Res call({
 int id, String? createdOn, String? modifiedOn, String? createdBy, String? modifiedBy, bool isDeleted, String? ownerId, String? firstName, String? lastName, String? fullName, String? email, String? phoneNumber, String? password, String? keycloakUserId, String? type, List<dynamic> addresses, List<dynamic> recentlySessions, List<dynamic> allSessions, int totalSessions, String? profileUrl
});




}
/// @nodoc
class _$UserDataCopyWithImpl<$Res>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._self, this._then);

  final UserData _self;
  final $Res Function(UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdOn = freezed,Object? modifiedOn = freezed,Object? createdBy = freezed,Object? modifiedBy = freezed,Object? isDeleted = null,Object? ownerId = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? password = freezed,Object? keycloakUserId = freezed,Object? type = freezed,Object? addresses = null,Object? recentlySessions = null,Object? allSessions = null,Object? totalSessions = null,Object? profileUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,modifiedOn: freezed == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,keycloakUserId: freezed == keycloakUserId ? _self.keycloakUserId : keycloakUserId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,addresses: null == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<dynamic>,recentlySessions: null == recentlySessions ? _self.recentlySessions : recentlySessions // ignore: cast_nullable_to_non_nullable
as List<dynamic>,allSessions: null == allSessions ? _self.allSessions : allSessions // ignore: cast_nullable_to_non_nullable
as List<dynamic>,totalSessions: null == totalSessions ? _self.totalSessions : totalSessions // ignore: cast_nullable_to_non_nullable
as int,profileUrl: freezed == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserData].
extension UserDataPatterns on UserData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserData value)  $default,){
final _that = this;
switch (_that) {
case _UserData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserData value)?  $default,){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? createdOn,  String? modifiedOn,  String? createdBy,  String? modifiedBy,  bool isDeleted,  String? ownerId,  String? firstName,  String? lastName,  String? fullName,  String? email,  String? phoneNumber,  String? password,  String? keycloakUserId,  String? type,  List<dynamic> addresses,  List<dynamic> recentlySessions,  List<dynamic> allSessions,  int totalSessions,  String? profileUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.firstName,_that.lastName,_that.fullName,_that.email,_that.phoneNumber,_that.password,_that.keycloakUserId,_that.type,_that.addresses,_that.recentlySessions,_that.allSessions,_that.totalSessions,_that.profileUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? createdOn,  String? modifiedOn,  String? createdBy,  String? modifiedBy,  bool isDeleted,  String? ownerId,  String? firstName,  String? lastName,  String? fullName,  String? email,  String? phoneNumber,  String? password,  String? keycloakUserId,  String? type,  List<dynamic> addresses,  List<dynamic> recentlySessions,  List<dynamic> allSessions,  int totalSessions,  String? profileUrl)  $default,) {final _that = this;
switch (_that) {
case _UserData():
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.firstName,_that.lastName,_that.fullName,_that.email,_that.phoneNumber,_that.password,_that.keycloakUserId,_that.type,_that.addresses,_that.recentlySessions,_that.allSessions,_that.totalSessions,_that.profileUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? createdOn,  String? modifiedOn,  String? createdBy,  String? modifiedBy,  bool isDeleted,  String? ownerId,  String? firstName,  String? lastName,  String? fullName,  String? email,  String? phoneNumber,  String? password,  String? keycloakUserId,  String? type,  List<dynamic> addresses,  List<dynamic> recentlySessions,  List<dynamic> allSessions,  int totalSessions,  String? profileUrl)?  $default,) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.firstName,_that.lastName,_that.fullName,_that.email,_that.phoneNumber,_that.password,_that.keycloakUserId,_that.type,_that.addresses,_that.recentlySessions,_that.allSessions,_that.totalSessions,_that.profileUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserData implements UserData {
  const _UserData({this.id = 0, this.createdOn, this.modifiedOn, this.createdBy, this.modifiedBy, this.isDeleted = false, this.ownerId, this.firstName, this.lastName, this.fullName, this.email, this.phoneNumber, this.password, this.keycloakUserId, this.type, final  List<dynamic> addresses = const [], final  List<dynamic> recentlySessions = const [], final  List<dynamic> allSessions = const [], this.totalSessions = 0, this.profileUrl}): _addresses = addresses,_recentlySessions = recentlySessions,_allSessions = allSessions;
  factory _UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

@override@JsonKey() final  int id;
@override final  String? createdOn;
@override final  String? modifiedOn;
@override final  String? createdBy;
@override final  String? modifiedBy;
@override@JsonKey() final  bool isDeleted;
@override final  String? ownerId;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? fullName;
@override final  String? email;
@override final  String? phoneNumber;
@override final  String? password;
@override final  String? keycloakUserId;
@override final  String? type;
 final  List<dynamic> _addresses;
@override@JsonKey() List<dynamic> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}

 final  List<dynamic> _recentlySessions;
@override@JsonKey() List<dynamic> get recentlySessions {
  if (_recentlySessions is EqualUnmodifiableListView) return _recentlySessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentlySessions);
}

 final  List<dynamic> _allSessions;
@override@JsonKey() List<dynamic> get allSessions {
  if (_allSessions is EqualUnmodifiableListView) return _allSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allSessions);
}

@override@JsonKey() final  int totalSessions;
@override final  String? profileUrl;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataCopyWith<_UserData> get copyWith => __$UserDataCopyWithImpl<_UserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password)&&(identical(other.keycloakUserId, keycloakUserId) || other.keycloakUserId == keycloakUserId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&const DeepCollectionEquality().equals(other._recentlySessions, _recentlySessions)&&const DeepCollectionEquality().equals(other._allSessions, _allSessions)&&(identical(other.totalSessions, totalSessions) || other.totalSessions == totalSessions)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdOn,modifiedOn,createdBy,modifiedBy,isDeleted,ownerId,firstName,lastName,fullName,email,phoneNumber,password,keycloakUserId,type,const DeepCollectionEquality().hash(_addresses),const DeepCollectionEquality().hash(_recentlySessions),const DeepCollectionEquality().hash(_allSessions),totalSessions,profileUrl]);

@override
String toString() {
  return 'UserData(id: $id, createdOn: $createdOn, modifiedOn: $modifiedOn, createdBy: $createdBy, modifiedBy: $modifiedBy, isDeleted: $isDeleted, ownerId: $ownerId, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, password: $password, keycloakUserId: $keycloakUserId, type: $type, addresses: $addresses, recentlySessions: $recentlySessions, allSessions: $allSessions, totalSessions: $totalSessions, profileUrl: $profileUrl)';
}


}

/// @nodoc
abstract mixin class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) _then) = __$UserDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String? createdOn, String? modifiedOn, String? createdBy, String? modifiedBy, bool isDeleted, String? ownerId, String? firstName, String? lastName, String? fullName, String? email, String? phoneNumber, String? password, String? keycloakUserId, String? type, List<dynamic> addresses, List<dynamic> recentlySessions, List<dynamic> allSessions, int totalSessions, String? profileUrl
});




}
/// @nodoc
class __$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(this._self, this._then);

  final _UserData _self;
  final $Res Function(_UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdOn = freezed,Object? modifiedOn = freezed,Object? createdBy = freezed,Object? modifiedBy = freezed,Object? isDeleted = null,Object? ownerId = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? password = freezed,Object? keycloakUserId = freezed,Object? type = freezed,Object? addresses = null,Object? recentlySessions = null,Object? allSessions = null,Object? totalSessions = null,Object? profileUrl = freezed,}) {
  return _then(_UserData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,modifiedOn: freezed == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,keycloakUserId: freezed == keycloakUserId ? _self.keycloakUserId : keycloakUserId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,addresses: null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<dynamic>,recentlySessions: null == recentlySessions ? _self._recentlySessions : recentlySessions // ignore: cast_nullable_to_non_nullable
as List<dynamic>,allSessions: null == allSessions ? _self._allSessions : allSessions // ignore: cast_nullable_to_non_nullable
as List<dynamic>,totalSessions: null == totalSessions ? _self.totalSessions : totalSessions // ignore: cast_nullable_to_non_nullable
as int,profileUrl: freezed == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
