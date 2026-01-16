// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponse {

@JsonKey(name: 'isSuccess') bool get isSuccess; LoginData get data; String get message;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'LoginResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'isSuccess') bool isSuccess, LoginData data, String message
});


$LoginDataCopyWith<$Res> get data;

}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginData,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginDataCopyWith<$Res> get data {
  
  return $LoginDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'isSuccess')  bool isSuccess,  LoginData data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'isSuccess')  bool isSuccess,  LoginData data,  String message)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'isSuccess')  bool isSuccess,  LoginData data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse implements LoginResponse {
  const _LoginResponse({@JsonKey(name: 'isSuccess') required this.isSuccess, required this.data, required this.message});
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override@JsonKey(name: 'isSuccess') final  bool isSuccess;
@override final  LoginData data;
@override final  String message;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'LoginResponse(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'isSuccess') bool isSuccess, LoginData data, String message
});


@override $LoginDataCopyWith<$Res> get data;

}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_LoginResponse(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginData,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginDataCopyWith<$Res> get data {
  
  return $LoginDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$LoginData {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'expires_in') int get expiresIn;@JsonKey(name: 'refresh_expires_in') int get refreshExpiresIn;@JsonKey(name: 'refresh_token') String get refreshToken;@JsonKey(name: 'token_type') String get tokenType;@JsonKey(name: 'id_token') String get idToken;@JsonKey(name: 'not-before-policy') int get notBeforePolicy;@JsonKey(name: 'session_state') String get sessionState; String get scope;
/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginDataCopyWith<LoginData> get copyWith => _$LoginDataCopyWithImpl<LoginData>(this as LoginData, _$identity);

  /// Serializes this LoginData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshExpiresIn, refreshExpiresIn) || other.refreshExpiresIn == refreshExpiresIn)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.notBeforePolicy, notBeforePolicy) || other.notBeforePolicy == notBeforePolicy)&&(identical(other.sessionState, sessionState) || other.sessionState == sessionState)&&(identical(other.scope, scope) || other.scope == scope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,expiresIn,refreshExpiresIn,refreshToken,tokenType,idToken,notBeforePolicy,sessionState,scope);

@override
String toString() {
  return 'LoginData(accessToken: $accessToken, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn, refreshToken: $refreshToken, tokenType: $tokenType, idToken: $idToken, notBeforePolicy: $notBeforePolicy, sessionState: $sessionState, scope: $scope)';
}


}

/// @nodoc
abstract mixin class $LoginDataCopyWith<$Res>  {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) _then) = _$LoginDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'refresh_expires_in') int refreshExpiresIn,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'token_type') String tokenType,@JsonKey(name: 'id_token') String idToken,@JsonKey(name: 'not-before-policy') int notBeforePolicy,@JsonKey(name: 'session_state') String sessionState, String scope
});




}
/// @nodoc
class _$LoginDataCopyWithImpl<$Res>
    implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._self, this._then);

  final LoginData _self;
  final $Res Function(LoginData) _then;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? expiresIn = null,Object? refreshExpiresIn = null,Object? refreshToken = null,Object? tokenType = null,Object? idToken = null,Object? notBeforePolicy = null,Object? sessionState = null,Object? scope = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshExpiresIn: null == refreshExpiresIn ? _self.refreshExpiresIn : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,notBeforePolicy: null == notBeforePolicy ? _self.notBeforePolicy : notBeforePolicy // ignore: cast_nullable_to_non_nullable
as int,sessionState: null == sessionState ? _self.sessionState : sessionState // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginData].
extension LoginDataPatterns on LoginData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginData value)  $default,){
final _that = this;
switch (_that) {
case _LoginData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginData value)?  $default,){
final _that = this;
switch (_that) {
case _LoginData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'refresh_expires_in')  int refreshExpiresIn, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'id_token')  String idToken, @JsonKey(name: 'not-before-policy')  int notBeforePolicy, @JsonKey(name: 'session_state')  String sessionState,  String scope)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginData() when $default != null:
return $default(_that.accessToken,_that.expiresIn,_that.refreshExpiresIn,_that.refreshToken,_that.tokenType,_that.idToken,_that.notBeforePolicy,_that.sessionState,_that.scope);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'refresh_expires_in')  int refreshExpiresIn, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'id_token')  String idToken, @JsonKey(name: 'not-before-policy')  int notBeforePolicy, @JsonKey(name: 'session_state')  String sessionState,  String scope)  $default,) {final _that = this;
switch (_that) {
case _LoginData():
return $default(_that.accessToken,_that.expiresIn,_that.refreshExpiresIn,_that.refreshToken,_that.tokenType,_that.idToken,_that.notBeforePolicy,_that.sessionState,_that.scope);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'refresh_expires_in')  int refreshExpiresIn, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'id_token')  String idToken, @JsonKey(name: 'not-before-policy')  int notBeforePolicy, @JsonKey(name: 'session_state')  String sessionState,  String scope)?  $default,) {final _that = this;
switch (_that) {
case _LoginData() when $default != null:
return $default(_that.accessToken,_that.expiresIn,_that.refreshExpiresIn,_that.refreshToken,_that.tokenType,_that.idToken,_that.notBeforePolicy,_that.sessionState,_that.scope);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginData implements LoginData {
  const _LoginData({@JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'expires_in') required this.expiresIn, @JsonKey(name: 'refresh_expires_in') required this.refreshExpiresIn, @JsonKey(name: 'refresh_token') required this.refreshToken, @JsonKey(name: 'token_type') required this.tokenType, @JsonKey(name: 'id_token') required this.idToken, @JsonKey(name: 'not-before-policy') required this.notBeforePolicy, @JsonKey(name: 'session_state') required this.sessionState, required this.scope});
  factory _LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'expires_in') final  int expiresIn;
@override@JsonKey(name: 'refresh_expires_in') final  int refreshExpiresIn;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override@JsonKey(name: 'token_type') final  String tokenType;
@override@JsonKey(name: 'id_token') final  String idToken;
@override@JsonKey(name: 'not-before-policy') final  int notBeforePolicy;
@override@JsonKey(name: 'session_state') final  String sessionState;
@override final  String scope;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginDataCopyWith<_LoginData> get copyWith => __$LoginDataCopyWithImpl<_LoginData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshExpiresIn, refreshExpiresIn) || other.refreshExpiresIn == refreshExpiresIn)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.notBeforePolicy, notBeforePolicy) || other.notBeforePolicy == notBeforePolicy)&&(identical(other.sessionState, sessionState) || other.sessionState == sessionState)&&(identical(other.scope, scope) || other.scope == scope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,expiresIn,refreshExpiresIn,refreshToken,tokenType,idToken,notBeforePolicy,sessionState,scope);

@override
String toString() {
  return 'LoginData(accessToken: $accessToken, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn, refreshToken: $refreshToken, tokenType: $tokenType, idToken: $idToken, notBeforePolicy: $notBeforePolicy, sessionState: $sessionState, scope: $scope)';
}


}

/// @nodoc
abstract mixin class _$LoginDataCopyWith<$Res> implements $LoginDataCopyWith<$Res> {
  factory _$LoginDataCopyWith(_LoginData value, $Res Function(_LoginData) _then) = __$LoginDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'refresh_expires_in') int refreshExpiresIn,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'token_type') String tokenType,@JsonKey(name: 'id_token') String idToken,@JsonKey(name: 'not-before-policy') int notBeforePolicy,@JsonKey(name: 'session_state') String sessionState, String scope
});




}
/// @nodoc
class __$LoginDataCopyWithImpl<$Res>
    implements _$LoginDataCopyWith<$Res> {
  __$LoginDataCopyWithImpl(this._self, this._then);

  final _LoginData _self;
  final $Res Function(_LoginData) _then;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? expiresIn = null,Object? refreshExpiresIn = null,Object? refreshToken = null,Object? tokenType = null,Object? idToken = null,Object? notBeforePolicy = null,Object? sessionState = null,Object? scope = null,}) {
  return _then(_LoginData(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshExpiresIn: null == refreshExpiresIn ? _self.refreshExpiresIn : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,notBeforePolicy: null == notBeforePolicy ? _self.notBeforePolicy : notBeforePolicy // ignore: cast_nullable_to_non_nullable
as int,sessionState: null == sessionState ? _self.sessionState : sessionState // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
