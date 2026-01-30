// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenResponseModel {

 bool get isSuccess; TokenData get data; String get message;
/// Create a copy of TokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenResponseModelCopyWith<TokenResponseModel> get copyWith => _$TokenResponseModelCopyWithImpl<TokenResponseModel>(this as TokenResponseModel, _$identity);

  /// Serializes this TokenResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenResponseModel&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'TokenResponseModel(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $TokenResponseModelCopyWith<$Res>  {
  factory $TokenResponseModelCopyWith(TokenResponseModel value, $Res Function(TokenResponseModel) _then) = _$TokenResponseModelCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, TokenData data, String message
});


$TokenDataCopyWith<$Res> get data;

}
/// @nodoc
class _$TokenResponseModelCopyWithImpl<$Res>
    implements $TokenResponseModelCopyWith<$Res> {
  _$TokenResponseModelCopyWithImpl(this._self, this._then);

  final TokenResponseModel _self;
  final $Res Function(TokenResponseModel) _then;

/// Create a copy of TokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TokenData,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of TokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenDataCopyWith<$Res> get data {
  
  return $TokenDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [TokenResponseModel].
extension TokenResponseModelPatterns on TokenResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _TokenResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _TokenResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  TokenData data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  TokenData data,  String message)  $default,) {final _that = this;
switch (_that) {
case _TokenResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  TokenData data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _TokenResponseModel() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenResponseModel implements TokenResponseModel {
  const _TokenResponseModel({required this.isSuccess, required this.data, required this.message});
  factory _TokenResponseModel.fromJson(Map<String, dynamic> json) => _$TokenResponseModelFromJson(json);

@override final  bool isSuccess;
@override final  TokenData data;
@override final  String message;

/// Create a copy of TokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenResponseModelCopyWith<_TokenResponseModel> get copyWith => __$TokenResponseModelCopyWithImpl<_TokenResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenResponseModel&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'TokenResponseModel(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$TokenResponseModelCopyWith<$Res> implements $TokenResponseModelCopyWith<$Res> {
  factory _$TokenResponseModelCopyWith(_TokenResponseModel value, $Res Function(_TokenResponseModel) _then) = __$TokenResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, TokenData data, String message
});


@override $TokenDataCopyWith<$Res> get data;

}
/// @nodoc
class __$TokenResponseModelCopyWithImpl<$Res>
    implements _$TokenResponseModelCopyWith<$Res> {
  __$TokenResponseModelCopyWithImpl(this._self, this._then);

  final _TokenResponseModel _self;
  final $Res Function(_TokenResponseModel) _then;

/// Create a copy of TokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_TokenResponseModel(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TokenData,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of TokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenDataCopyWith<$Res> get data {
  
  return $TokenDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$TokenData {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'refresh_token') String get refreshToken;@JsonKey(name: 'expires_in') int get expiresIn;@JsonKey(name: 'refresh_expires_in') int get refreshExpiresIn;@JsonKey(name: 'token_type') String get tokenType;
/// Create a copy of TokenData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenDataCopyWith<TokenData> get copyWith => _$TokenDataCopyWithImpl<TokenData>(this as TokenData, _$identity);

  /// Serializes this TokenData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshExpiresIn, refreshExpiresIn) || other.refreshExpiresIn == refreshExpiresIn)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresIn,refreshExpiresIn,tokenType);

@override
String toString() {
  return 'TokenData(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class $TokenDataCopyWith<$Res>  {
  factory $TokenDataCopyWith(TokenData value, $Res Function(TokenData) _then) = _$TokenDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'refresh_expires_in') int refreshExpiresIn,@JsonKey(name: 'token_type') String tokenType
});




}
/// @nodoc
class _$TokenDataCopyWithImpl<$Res>
    implements $TokenDataCopyWith<$Res> {
  _$TokenDataCopyWithImpl(this._self, this._then);

  final TokenData _self;
  final $Res Function(TokenData) _then;

/// Create a copy of TokenData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,Object? refreshExpiresIn = null,Object? tokenType = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshExpiresIn: null == refreshExpiresIn ? _self.refreshExpiresIn : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
as int,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenData].
extension TokenDataPatterns on TokenData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenData value)  $default,){
final _that = this;
switch (_that) {
case _TokenData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenData value)?  $default,){
final _that = this;
switch (_that) {
case _TokenData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'refresh_expires_in')  int refreshExpiresIn, @JsonKey(name: 'token_type')  String tokenType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenData() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.refreshExpiresIn,_that.tokenType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'refresh_expires_in')  int refreshExpiresIn, @JsonKey(name: 'token_type')  String tokenType)  $default,) {final _that = this;
switch (_that) {
case _TokenData():
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.refreshExpiresIn,_that.tokenType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'refresh_expires_in')  int refreshExpiresIn, @JsonKey(name: 'token_type')  String tokenType)?  $default,) {final _that = this;
switch (_that) {
case _TokenData() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.refreshExpiresIn,_that.tokenType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenData implements TokenData {
  const _TokenData({@JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'refresh_token') required this.refreshToken, @JsonKey(name: 'expires_in') required this.expiresIn, @JsonKey(name: 'refresh_expires_in') required this.refreshExpiresIn, @JsonKey(name: 'token_type') required this.tokenType});
  factory _TokenData.fromJson(Map<String, dynamic> json) => _$TokenDataFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override@JsonKey(name: 'expires_in') final  int expiresIn;
@override@JsonKey(name: 'refresh_expires_in') final  int refreshExpiresIn;
@override@JsonKey(name: 'token_type') final  String tokenType;

/// Create a copy of TokenData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenDataCopyWith<_TokenData> get copyWith => __$TokenDataCopyWithImpl<_TokenData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.refreshExpiresIn, refreshExpiresIn) || other.refreshExpiresIn == refreshExpiresIn)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresIn,refreshExpiresIn,tokenType);

@override
String toString() {
  return 'TokenData(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class _$TokenDataCopyWith<$Res> implements $TokenDataCopyWith<$Res> {
  factory _$TokenDataCopyWith(_TokenData value, $Res Function(_TokenData) _then) = __$TokenDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'refresh_expires_in') int refreshExpiresIn,@JsonKey(name: 'token_type') String tokenType
});




}
/// @nodoc
class __$TokenDataCopyWithImpl<$Res>
    implements _$TokenDataCopyWith<$Res> {
  __$TokenDataCopyWithImpl(this._self, this._then);

  final _TokenData _self;
  final $Res Function(_TokenData) _then;

/// Create a copy of TokenData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,Object? refreshExpiresIn = null,Object? tokenType = null,}) {
  return _then(_TokenData(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,refreshExpiresIn: null == refreshExpiresIn ? _self.refreshExpiresIn : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
as int,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
