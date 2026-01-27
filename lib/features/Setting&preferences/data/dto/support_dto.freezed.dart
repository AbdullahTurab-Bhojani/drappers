// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupportRequestDto {

 String get fullName; String get email; String get subject; String get message; String get imageUrl;
/// Create a copy of SupportRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportRequestDtoCopyWith<SupportRequestDto> get copyWith => _$SupportRequestDtoCopyWithImpl<SupportRequestDto>(this as SupportRequestDto, _$identity);

  /// Serializes this SupportRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportRequestDto&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.message, message) || other.message == message)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,subject,message,imageUrl);

@override
String toString() {
  return 'SupportRequestDto(fullName: $fullName, email: $email, subject: $subject, message: $message, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $SupportRequestDtoCopyWith<$Res>  {
  factory $SupportRequestDtoCopyWith(SupportRequestDto value, $Res Function(SupportRequestDto) _then) = _$SupportRequestDtoCopyWithImpl;
@useResult
$Res call({
 String fullName, String email, String subject, String message, String imageUrl
});




}
/// @nodoc
class _$SupportRequestDtoCopyWithImpl<$Res>
    implements $SupportRequestDtoCopyWith<$Res> {
  _$SupportRequestDtoCopyWithImpl(this._self, this._then);

  final SupportRequestDto _self;
  final $Res Function(SupportRequestDto) _then;

/// Create a copy of SupportRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? email = null,Object? subject = null,Object? message = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportRequestDto].
extension SupportRequestDtoPatterns on SupportRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _SupportRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _SupportRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String email,  String subject,  String message,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportRequestDto() when $default != null:
return $default(_that.fullName,_that.email,_that.subject,_that.message,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String email,  String subject,  String message,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _SupportRequestDto():
return $default(_that.fullName,_that.email,_that.subject,_that.message,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String email,  String subject,  String message,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _SupportRequestDto() when $default != null:
return $default(_that.fullName,_that.email,_that.subject,_that.message,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportRequestDto implements SupportRequestDto {
  const _SupportRequestDto({required this.fullName, required this.email, required this.subject, required this.message, required this.imageUrl});
  factory _SupportRequestDto.fromJson(Map<String, dynamic> json) => _$SupportRequestDtoFromJson(json);

@override final  String fullName;
@override final  String email;
@override final  String subject;
@override final  String message;
@override final  String imageUrl;

/// Create a copy of SupportRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportRequestDtoCopyWith<_SupportRequestDto> get copyWith => __$SupportRequestDtoCopyWithImpl<_SupportRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportRequestDto&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.message, message) || other.message == message)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,subject,message,imageUrl);

@override
String toString() {
  return 'SupportRequestDto(fullName: $fullName, email: $email, subject: $subject, message: $message, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$SupportRequestDtoCopyWith<$Res> implements $SupportRequestDtoCopyWith<$Res> {
  factory _$SupportRequestDtoCopyWith(_SupportRequestDto value, $Res Function(_SupportRequestDto) _then) = __$SupportRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String email, String subject, String message, String imageUrl
});




}
/// @nodoc
class __$SupportRequestDtoCopyWithImpl<$Res>
    implements _$SupportRequestDtoCopyWith<$Res> {
  __$SupportRequestDtoCopyWithImpl(this._self, this._then);

  final _SupportRequestDto _self;
  final $Res Function(_SupportRequestDto) _then;

/// Create a copy of SupportRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? email = null,Object? subject = null,Object? message = null,Object? imageUrl = null,}) {
  return _then(_SupportRequestDto(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
