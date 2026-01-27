// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoogleSocialModel {

 bool get isSuccess; String get message;@JsonKey(name: 'data') GoogleSocialData? get data;
/// Create a copy of GoogleSocialModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleSocialModelCopyWith<GoogleSocialModel> get copyWith => _$GoogleSocialModelCopyWithImpl<GoogleSocialModel>(this as GoogleSocialModel, _$identity);

  /// Serializes this GoogleSocialModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleSocialModel&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,message,data);

@override
String toString() {
  return 'GoogleSocialModel(isSuccess: $isSuccess, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $GoogleSocialModelCopyWith<$Res>  {
  factory $GoogleSocialModelCopyWith(GoogleSocialModel value, $Res Function(GoogleSocialModel) _then) = _$GoogleSocialModelCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, String message,@JsonKey(name: 'data') GoogleSocialData? data
});


$GoogleSocialDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$GoogleSocialModelCopyWithImpl<$Res>
    implements $GoogleSocialModelCopyWith<$Res> {
  _$GoogleSocialModelCopyWithImpl(this._self, this._then);

  final GoogleSocialModel _self;
  final $Res Function(GoogleSocialModel) _then;

/// Create a copy of GoogleSocialModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as GoogleSocialData?,
  ));
}
/// Create a copy of GoogleSocialModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoogleSocialDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $GoogleSocialDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [GoogleSocialModel].
extension GoogleSocialModelPatterns on GoogleSocialModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleSocialModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleSocialModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleSocialModel value)  $default,){
final _that = this;
switch (_that) {
case _GoogleSocialModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleSocialModel value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleSocialModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  String message, @JsonKey(name: 'data')  GoogleSocialData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleSocialModel() when $default != null:
return $default(_that.isSuccess,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  String message, @JsonKey(name: 'data')  GoogleSocialData? data)  $default,) {final _that = this;
switch (_that) {
case _GoogleSocialModel():
return $default(_that.isSuccess,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  String message, @JsonKey(name: 'data')  GoogleSocialData? data)?  $default,) {final _that = this;
switch (_that) {
case _GoogleSocialModel() when $default != null:
return $default(_that.isSuccess,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleSocialModel implements GoogleSocialModel {
  const _GoogleSocialModel({this.isSuccess = false, this.message = '', @JsonKey(name: 'data') this.data});
  factory _GoogleSocialModel.fromJson(Map<String, dynamic> json) => _$GoogleSocialModelFromJson(json);

@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  String message;
@override@JsonKey(name: 'data') final  GoogleSocialData? data;

/// Create a copy of GoogleSocialModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleSocialModelCopyWith<_GoogleSocialModel> get copyWith => __$GoogleSocialModelCopyWithImpl<_GoogleSocialModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleSocialModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleSocialModel&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,message,data);

@override
String toString() {
  return 'GoogleSocialModel(isSuccess: $isSuccess, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$GoogleSocialModelCopyWith<$Res> implements $GoogleSocialModelCopyWith<$Res> {
  factory _$GoogleSocialModelCopyWith(_GoogleSocialModel value, $Res Function(_GoogleSocialModel) _then) = __$GoogleSocialModelCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, String message,@JsonKey(name: 'data') GoogleSocialData? data
});


@override $GoogleSocialDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$GoogleSocialModelCopyWithImpl<$Res>
    implements _$GoogleSocialModelCopyWith<$Res> {
  __$GoogleSocialModelCopyWithImpl(this._self, this._then);

  final _GoogleSocialModel _self;
  final $Res Function(_GoogleSocialModel) _then;

/// Create a copy of GoogleSocialModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? message = null,Object? data = freezed,}) {
  return _then(_GoogleSocialModel(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as GoogleSocialData?,
  ));
}

/// Create a copy of GoogleSocialModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoogleSocialDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $GoogleSocialDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$GoogleSocialData {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'refresh_token') String get refreshToken;@JsonKey(name: 'expires_in') int get expiresIn;@JsonKey(name: 'refresh_expires_in') int get refreshExpiresIn;@JsonKey(name: 'token_type') String get tokenType; GoogleUser? get user;
/// Create a copy of GoogleSocialData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleSocialDataCopyWith<GoogleSocialData> get copyWith => _$GoogleSocialDataCopyWithImpl<GoogleSocialData>(this as GoogleSocialData, _$identity);

  /// Serializes this GoogleSocialData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleSocialData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshExpiresIn, refreshExpiresIn) || other.refreshExpiresIn == refreshExpiresIn)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresIn,refreshExpiresIn,tokenType,user);

@override
String toString() {
  return 'GoogleSocialData(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn, tokenType: $tokenType, user: $user)';
}


}

/// @nodoc
abstract mixin class $GoogleSocialDataCopyWith<$Res>  {
  factory $GoogleSocialDataCopyWith(GoogleSocialData value, $Res Function(GoogleSocialData) _then) = _$GoogleSocialDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'refresh_expires_in') int refreshExpiresIn,@JsonKey(name: 'token_type') String tokenType, GoogleUser? user
});


$GoogleUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$GoogleSocialDataCopyWithImpl<$Res>
    implements $GoogleSocialDataCopyWith<$Res> {
  _$GoogleSocialDataCopyWithImpl(this._self, this._then);

  final GoogleSocialData _self;
  final $Res Function(GoogleSocialData) _then;

/// Create a copy of GoogleSocialData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,Object? refreshExpiresIn = null,Object? tokenType = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshExpiresIn: null == refreshExpiresIn ? _self.refreshExpiresIn : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
as int,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as GoogleUser?,
  ));
}
/// Create a copy of GoogleSocialData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoogleUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $GoogleUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [GoogleSocialData].
extension GoogleSocialDataPatterns on GoogleSocialData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleSocialData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleSocialData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleSocialData value)  $default,){
final _that = this;
switch (_that) {
case _GoogleSocialData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleSocialData value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleSocialData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'refresh_expires_in')  int refreshExpiresIn, @JsonKey(name: 'token_type')  String tokenType,  GoogleUser? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleSocialData() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.refreshExpiresIn,_that.tokenType,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'refresh_expires_in')  int refreshExpiresIn, @JsonKey(name: 'token_type')  String tokenType,  GoogleUser? user)  $default,) {final _that = this;
switch (_that) {
case _GoogleSocialData():
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.refreshExpiresIn,_that.tokenType,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'refresh_expires_in')  int refreshExpiresIn, @JsonKey(name: 'token_type')  String tokenType,  GoogleUser? user)?  $default,) {final _that = this;
switch (_that) {
case _GoogleSocialData() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.refreshExpiresIn,_that.tokenType,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleSocialData implements GoogleSocialData {
  const _GoogleSocialData({@JsonKey(name: 'access_token') this.accessToken = '', @JsonKey(name: 'refresh_token') this.refreshToken = '', @JsonKey(name: 'expires_in') this.expiresIn = 0, @JsonKey(name: 'refresh_expires_in') this.refreshExpiresIn = 0, @JsonKey(name: 'token_type') this.tokenType = 'Bearer', this.user});
  factory _GoogleSocialData.fromJson(Map<String, dynamic> json) => _$GoogleSocialDataFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override@JsonKey(name: 'expires_in') final  int expiresIn;
@override@JsonKey(name: 'refresh_expires_in') final  int refreshExpiresIn;
@override@JsonKey(name: 'token_type') final  String tokenType;
@override final  GoogleUser? user;

/// Create a copy of GoogleSocialData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleSocialDataCopyWith<_GoogleSocialData> get copyWith => __$GoogleSocialDataCopyWithImpl<_GoogleSocialData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleSocialDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleSocialData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshExpiresIn, refreshExpiresIn) || other.refreshExpiresIn == refreshExpiresIn)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresIn,refreshExpiresIn,tokenType,user);

@override
String toString() {
  return 'GoogleSocialData(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn, tokenType: $tokenType, user: $user)';
}


}

/// @nodoc
abstract mixin class _$GoogleSocialDataCopyWith<$Res> implements $GoogleSocialDataCopyWith<$Res> {
  factory _$GoogleSocialDataCopyWith(_GoogleSocialData value, $Res Function(_GoogleSocialData) _then) = __$GoogleSocialDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'refresh_expires_in') int refreshExpiresIn,@JsonKey(name: 'token_type') String tokenType, GoogleUser? user
});


@override $GoogleUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$GoogleSocialDataCopyWithImpl<$Res>
    implements _$GoogleSocialDataCopyWith<$Res> {
  __$GoogleSocialDataCopyWithImpl(this._self, this._then);

  final _GoogleSocialData _self;
  final $Res Function(_GoogleSocialData) _then;

/// Create a copy of GoogleSocialData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,Object? refreshExpiresIn = null,Object? tokenType = null,Object? user = freezed,}) {
  return _then(_GoogleSocialData(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshExpiresIn: null == refreshExpiresIn ? _self.refreshExpiresIn : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
as int,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as GoogleUser?,
  ));
}

/// Create a copy of GoogleSocialData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoogleUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $GoogleUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$GoogleUser {

 String get sub;@JsonKey(name: 'email_verified') bool get emailVerified; String get name;@JsonKey(name: 'preferred_username') String get preferredUsername;@JsonKey(name: 'given_name') String get givenName;@JsonKey(name: 'family_name') String get familyName; String get email;
/// Create a copy of GoogleUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleUserCopyWith<GoogleUser> get copyWith => _$GoogleUserCopyWithImpl<GoogleUser>(this as GoogleUser, _$identity);

  /// Serializes this GoogleUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleUser&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.name, name) || other.name == name)&&(identical(other.preferredUsername, preferredUsername) || other.preferredUsername == preferredUsername)&&(identical(other.givenName, givenName) || other.givenName == givenName)&&(identical(other.familyName, familyName) || other.familyName == familyName)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sub,emailVerified,name,preferredUsername,givenName,familyName,email);

@override
String toString() {
  return 'GoogleUser(sub: $sub, emailVerified: $emailVerified, name: $name, preferredUsername: $preferredUsername, givenName: $givenName, familyName: $familyName, email: $email)';
}


}

/// @nodoc
abstract mixin class $GoogleUserCopyWith<$Res>  {
  factory $GoogleUserCopyWith(GoogleUser value, $Res Function(GoogleUser) _then) = _$GoogleUserCopyWithImpl;
@useResult
$Res call({
 String sub,@JsonKey(name: 'email_verified') bool emailVerified, String name,@JsonKey(name: 'preferred_username') String preferredUsername,@JsonKey(name: 'given_name') String givenName,@JsonKey(name: 'family_name') String familyName, String email
});




}
/// @nodoc
class _$GoogleUserCopyWithImpl<$Res>
    implements $GoogleUserCopyWith<$Res> {
  _$GoogleUserCopyWithImpl(this._self, this._then);

  final GoogleUser _self;
  final $Res Function(GoogleUser) _then;

/// Create a copy of GoogleUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sub = null,Object? emailVerified = null,Object? name = null,Object? preferredUsername = null,Object? givenName = null,Object? familyName = null,Object? email = null,}) {
  return _then(_self.copyWith(
sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,preferredUsername: null == preferredUsername ? _self.preferredUsername : preferredUsername // ignore: cast_nullable_to_non_nullable
as String,givenName: null == givenName ? _self.givenName : givenName // ignore: cast_nullable_to_non_nullable
as String,familyName: null == familyName ? _self.familyName : familyName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GoogleUser].
extension GoogleUserPatterns on GoogleUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleUser value)  $default,){
final _that = this;
switch (_that) {
case _GoogleUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleUser value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sub, @JsonKey(name: 'email_verified')  bool emailVerified,  String name, @JsonKey(name: 'preferred_username')  String preferredUsername, @JsonKey(name: 'given_name')  String givenName, @JsonKey(name: 'family_name')  String familyName,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleUser() when $default != null:
return $default(_that.sub,_that.emailVerified,_that.name,_that.preferredUsername,_that.givenName,_that.familyName,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sub, @JsonKey(name: 'email_verified')  bool emailVerified,  String name, @JsonKey(name: 'preferred_username')  String preferredUsername, @JsonKey(name: 'given_name')  String givenName, @JsonKey(name: 'family_name')  String familyName,  String email)  $default,) {final _that = this;
switch (_that) {
case _GoogleUser():
return $default(_that.sub,_that.emailVerified,_that.name,_that.preferredUsername,_that.givenName,_that.familyName,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sub, @JsonKey(name: 'email_verified')  bool emailVerified,  String name, @JsonKey(name: 'preferred_username')  String preferredUsername, @JsonKey(name: 'given_name')  String givenName, @JsonKey(name: 'family_name')  String familyName,  String email)?  $default,) {final _that = this;
switch (_that) {
case _GoogleUser() when $default != null:
return $default(_that.sub,_that.emailVerified,_that.name,_that.preferredUsername,_that.givenName,_that.familyName,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleUser implements GoogleUser {
  const _GoogleUser({this.sub = '', @JsonKey(name: 'email_verified') this.emailVerified = false, this.name = '', @JsonKey(name: 'preferred_username') this.preferredUsername = '', @JsonKey(name: 'given_name') this.givenName = '', @JsonKey(name: 'family_name') this.familyName = '', this.email = ''});
  factory _GoogleUser.fromJson(Map<String, dynamic> json) => _$GoogleUserFromJson(json);

@override@JsonKey() final  String sub;
@override@JsonKey(name: 'email_verified') final  bool emailVerified;
@override@JsonKey() final  String name;
@override@JsonKey(name: 'preferred_username') final  String preferredUsername;
@override@JsonKey(name: 'given_name') final  String givenName;
@override@JsonKey(name: 'family_name') final  String familyName;
@override@JsonKey() final  String email;

/// Create a copy of GoogleUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleUserCopyWith<_GoogleUser> get copyWith => __$GoogleUserCopyWithImpl<_GoogleUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleUser&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.name, name) || other.name == name)&&(identical(other.preferredUsername, preferredUsername) || other.preferredUsername == preferredUsername)&&(identical(other.givenName, givenName) || other.givenName == givenName)&&(identical(other.familyName, familyName) || other.familyName == familyName)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sub,emailVerified,name,preferredUsername,givenName,familyName,email);

@override
String toString() {
  return 'GoogleUser(sub: $sub, emailVerified: $emailVerified, name: $name, preferredUsername: $preferredUsername, givenName: $givenName, familyName: $familyName, email: $email)';
}


}

/// @nodoc
abstract mixin class _$GoogleUserCopyWith<$Res> implements $GoogleUserCopyWith<$Res> {
  factory _$GoogleUserCopyWith(_GoogleUser value, $Res Function(_GoogleUser) _then) = __$GoogleUserCopyWithImpl;
@override @useResult
$Res call({
 String sub,@JsonKey(name: 'email_verified') bool emailVerified, String name,@JsonKey(name: 'preferred_username') String preferredUsername,@JsonKey(name: 'given_name') String givenName,@JsonKey(name: 'family_name') String familyName, String email
});




}
/// @nodoc
class __$GoogleUserCopyWithImpl<$Res>
    implements _$GoogleUserCopyWith<$Res> {
  __$GoogleUserCopyWithImpl(this._self, this._then);

  final _GoogleUser _self;
  final $Res Function(_GoogleUser) _then;

/// Create a copy of GoogleUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sub = null,Object? emailVerified = null,Object? name = null,Object? preferredUsername = null,Object? givenName = null,Object? familyName = null,Object? email = null,}) {
  return _then(_GoogleUser(
sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,preferredUsername: null == preferredUsername ? _self.preferredUsername : preferredUsername // ignore: cast_nullable_to_non_nullable
as String,givenName: null == givenName ? _self.givenName : givenName // ignore: cast_nullable_to_non_nullable
as String,familyName: null == familyName ? _self.familyName : familyName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
