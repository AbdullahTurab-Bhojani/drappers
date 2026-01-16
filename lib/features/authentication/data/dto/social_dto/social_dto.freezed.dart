// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialDTO {

@JsonKey(name: 'subject_token') String get subjectToken;@JsonKey(name: 'subject_issuer') String get subjectIssuer;@JsonKey(name: 'email') String get email;
/// Create a copy of SocialDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialDTOCopyWith<SocialDTO> get copyWith => _$SocialDTOCopyWithImpl<SocialDTO>(this as SocialDTO, _$identity);

  /// Serializes this SocialDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialDTO&&(identical(other.subjectToken, subjectToken) || other.subjectToken == subjectToken)&&(identical(other.subjectIssuer, subjectIssuer) || other.subjectIssuer == subjectIssuer)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectToken,subjectIssuer,email);

@override
String toString() {
  return 'SocialDTO(subjectToken: $subjectToken, subjectIssuer: $subjectIssuer, email: $email)';
}


}

/// @nodoc
abstract mixin class $SocialDTOCopyWith<$Res>  {
  factory $SocialDTOCopyWith(SocialDTO value, $Res Function(SocialDTO) _then) = _$SocialDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'subject_token') String subjectToken,@JsonKey(name: 'subject_issuer') String subjectIssuer,@JsonKey(name: 'email') String email
});




}
/// @nodoc
class _$SocialDTOCopyWithImpl<$Res>
    implements $SocialDTOCopyWith<$Res> {
  _$SocialDTOCopyWithImpl(this._self, this._then);

  final SocialDTO _self;
  final $Res Function(SocialDTO) _then;

/// Create a copy of SocialDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subjectToken = null,Object? subjectIssuer = null,Object? email = null,}) {
  return _then(_self.copyWith(
subjectToken: null == subjectToken ? _self.subjectToken : subjectToken // ignore: cast_nullable_to_non_nullable
as String,subjectIssuer: null == subjectIssuer ? _self.subjectIssuer : subjectIssuer // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SocialDTO].
extension SocialDTOPatterns on SocialDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialDTO value)  $default,){
final _that = this;
switch (_that) {
case _SocialDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialDTO value)?  $default,){
final _that = this;
switch (_that) {
case _SocialDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'subject_token')  String subjectToken, @JsonKey(name: 'subject_issuer')  String subjectIssuer, @JsonKey(name: 'email')  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialDTO() when $default != null:
return $default(_that.subjectToken,_that.subjectIssuer,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'subject_token')  String subjectToken, @JsonKey(name: 'subject_issuer')  String subjectIssuer, @JsonKey(name: 'email')  String email)  $default,) {final _that = this;
switch (_that) {
case _SocialDTO():
return $default(_that.subjectToken,_that.subjectIssuer,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'subject_token')  String subjectToken, @JsonKey(name: 'subject_issuer')  String subjectIssuer, @JsonKey(name: 'email')  String email)?  $default,) {final _that = this;
switch (_that) {
case _SocialDTO() when $default != null:
return $default(_that.subjectToken,_that.subjectIssuer,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialDTO implements SocialDTO {
  const _SocialDTO({@JsonKey(name: 'subject_token') required this.subjectToken, @JsonKey(name: 'subject_issuer') required this.subjectIssuer, @JsonKey(name: 'email') required this.email});
  factory _SocialDTO.fromJson(Map<String, dynamic> json) => _$SocialDTOFromJson(json);

@override@JsonKey(name: 'subject_token') final  String subjectToken;
@override@JsonKey(name: 'subject_issuer') final  String subjectIssuer;
@override@JsonKey(name: 'email') final  String email;

/// Create a copy of SocialDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialDTOCopyWith<_SocialDTO> get copyWith => __$SocialDTOCopyWithImpl<_SocialDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialDTO&&(identical(other.subjectToken, subjectToken) || other.subjectToken == subjectToken)&&(identical(other.subjectIssuer, subjectIssuer) || other.subjectIssuer == subjectIssuer)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectToken,subjectIssuer,email);

@override
String toString() {
  return 'SocialDTO(subjectToken: $subjectToken, subjectIssuer: $subjectIssuer, email: $email)';
}


}

/// @nodoc
abstract mixin class _$SocialDTOCopyWith<$Res> implements $SocialDTOCopyWith<$Res> {
  factory _$SocialDTOCopyWith(_SocialDTO value, $Res Function(_SocialDTO) _then) = __$SocialDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'subject_token') String subjectToken,@JsonKey(name: 'subject_issuer') String subjectIssuer,@JsonKey(name: 'email') String email
});




}
/// @nodoc
class __$SocialDTOCopyWithImpl<$Res>
    implements _$SocialDTOCopyWith<$Res> {
  __$SocialDTOCopyWithImpl(this._self, this._then);

  final _SocialDTO _self;
  final $Res Function(_SocialDTO) _then;

/// Create a copy of SocialDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subjectToken = null,Object? subjectIssuer = null,Object? email = null,}) {
  return _then(_SocialDTO(
subjectToken: null == subjectToken ? _self.subjectToken : subjectToken // ignore: cast_nullable_to_non_nullable
as String,subjectIssuer: null == subjectIssuer ? _self.subjectIssuer : subjectIssuer // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
