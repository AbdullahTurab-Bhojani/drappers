// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pitch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PitchDto {

 String get address; String get fullName; String get startUpName; String get email; String get link;
/// Create a copy of PitchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PitchDtoCopyWith<PitchDto> get copyWith => _$PitchDtoCopyWithImpl<PitchDto>(this as PitchDto, _$identity);

  /// Serializes this PitchDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PitchDto&&(identical(other.address, address) || other.address == address)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.startUpName, startUpName) || other.startUpName == startUpName)&&(identical(other.email, email) || other.email == email)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,fullName,startUpName,email,link);

@override
String toString() {
  return 'PitchDto(address: $address, fullName: $fullName, startUpName: $startUpName, email: $email, link: $link)';
}


}

/// @nodoc
abstract mixin class $PitchDtoCopyWith<$Res>  {
  factory $PitchDtoCopyWith(PitchDto value, $Res Function(PitchDto) _then) = _$PitchDtoCopyWithImpl;
@useResult
$Res call({
 String address, String fullName, String startUpName, String email, String link
});




}
/// @nodoc
class _$PitchDtoCopyWithImpl<$Res>
    implements $PitchDtoCopyWith<$Res> {
  _$PitchDtoCopyWithImpl(this._self, this._then);

  final PitchDto _self;
  final $Res Function(PitchDto) _then;

/// Create a copy of PitchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? fullName = null,Object? startUpName = null,Object? email = null,Object? link = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,startUpName: null == startUpName ? _self.startUpName : startUpName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PitchDto].
extension PitchDtoPatterns on PitchDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PitchDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PitchDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PitchDto value)  $default,){
final _that = this;
switch (_that) {
case _PitchDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PitchDto value)?  $default,){
final _that = this;
switch (_that) {
case _PitchDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  String fullName,  String startUpName,  String email,  String link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PitchDto() when $default != null:
return $default(_that.address,_that.fullName,_that.startUpName,_that.email,_that.link);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  String fullName,  String startUpName,  String email,  String link)  $default,) {final _that = this;
switch (_that) {
case _PitchDto():
return $default(_that.address,_that.fullName,_that.startUpName,_that.email,_that.link);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  String fullName,  String startUpName,  String email,  String link)?  $default,) {final _that = this;
switch (_that) {
case _PitchDto() when $default != null:
return $default(_that.address,_that.fullName,_that.startUpName,_that.email,_that.link);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PitchDto implements PitchDto {
  const _PitchDto({required this.address, required this.fullName, required this.startUpName, required this.email, required this.link});
  factory _PitchDto.fromJson(Map<String, dynamic> json) => _$PitchDtoFromJson(json);

@override final  String address;
@override final  String fullName;
@override final  String startUpName;
@override final  String email;
@override final  String link;

/// Create a copy of PitchDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PitchDtoCopyWith<_PitchDto> get copyWith => __$PitchDtoCopyWithImpl<_PitchDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PitchDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PitchDto&&(identical(other.address, address) || other.address == address)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.startUpName, startUpName) || other.startUpName == startUpName)&&(identical(other.email, email) || other.email == email)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,fullName,startUpName,email,link);

@override
String toString() {
  return 'PitchDto(address: $address, fullName: $fullName, startUpName: $startUpName, email: $email, link: $link)';
}


}

/// @nodoc
abstract mixin class _$PitchDtoCopyWith<$Res> implements $PitchDtoCopyWith<$Res> {
  factory _$PitchDtoCopyWith(_PitchDto value, $Res Function(_PitchDto) _then) = __$PitchDtoCopyWithImpl;
@override @useResult
$Res call({
 String address, String fullName, String startUpName, String email, String link
});




}
/// @nodoc
class __$PitchDtoCopyWithImpl<$Res>
    implements _$PitchDtoCopyWith<$Res> {
  __$PitchDtoCopyWithImpl(this._self, this._then);

  final _PitchDto _self;
  final $Res Function(_PitchDto) _then;

/// Create a copy of PitchDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? fullName = null,Object? startUpName = null,Object? email = null,Object? link = null,}) {
  return _then(_PitchDto(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,startUpName: null == startUpName ? _self.startUpName : startUpName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
