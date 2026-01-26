// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'static_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaticContent {

 bool get isSuccess; PolicyData get data; String get message;
/// Create a copy of StaticContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaticContentCopyWith<StaticContent> get copyWith => _$StaticContentCopyWithImpl<StaticContent>(this as StaticContent, _$identity);

  /// Serializes this StaticContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaticContent&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'StaticContent(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $StaticContentCopyWith<$Res>  {
  factory $StaticContentCopyWith(StaticContent value, $Res Function(StaticContent) _then) = _$StaticContentCopyWithImpl;
@useResult
$Res call({
 bool isSuccess, PolicyData data, String message
});


$PolicyDataCopyWith<$Res> get data;

}
/// @nodoc
class _$StaticContentCopyWithImpl<$Res>
    implements $StaticContentCopyWith<$Res> {
  _$StaticContentCopyWithImpl(this._self, this._then);

  final StaticContent _self;
  final $Res Function(StaticContent) _then;

/// Create a copy of StaticContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_self.copyWith(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PolicyData,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of StaticContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PolicyDataCopyWith<$Res> get data {
  
  return $PolicyDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [StaticContent].
extension StaticContentPatterns on StaticContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaticContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaticContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaticContent value)  $default,){
final _that = this;
switch (_that) {
case _StaticContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaticContent value)?  $default,){
final _that = this;
switch (_that) {
case _StaticContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSuccess,  PolicyData data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaticContent() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSuccess,  PolicyData data,  String message)  $default,) {final _that = this;
switch (_that) {
case _StaticContent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSuccess,  PolicyData data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _StaticContent() when $default != null:
return $default(_that.isSuccess,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StaticContent implements StaticContent {
  const _StaticContent({required this.isSuccess, required this.data, required this.message});
  factory _StaticContent.fromJson(Map<String, dynamic> json) => _$StaticContentFromJson(json);

@override final  bool isSuccess;
@override final  PolicyData data;
@override final  String message;

/// Create a copy of StaticContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaticContentCopyWith<_StaticContent> get copyWith => __$StaticContentCopyWithImpl<_StaticContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaticContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaticContent&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccess,data,message);

@override
String toString() {
  return 'StaticContent(isSuccess: $isSuccess, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$StaticContentCopyWith<$Res> implements $StaticContentCopyWith<$Res> {
  factory _$StaticContentCopyWith(_StaticContent value, $Res Function(_StaticContent) _then) = __$StaticContentCopyWithImpl;
@override @useResult
$Res call({
 bool isSuccess, PolicyData data, String message
});


@override $PolicyDataCopyWith<$Res> get data;

}
/// @nodoc
class __$StaticContentCopyWithImpl<$Res>
    implements _$StaticContentCopyWith<$Res> {
  __$StaticContentCopyWithImpl(this._self, this._then);

  final _StaticContent _self;
  final $Res Function(_StaticContent) _then;

/// Create a copy of StaticContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,Object? data = null,Object? message = null,}) {
  return _then(_StaticContent(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PolicyData,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of StaticContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PolicyDataCopyWith<$Res> get data {
  
  return $PolicyDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$PolicyData {

 int get id; DateTime get createdOn; DateTime get modifiedOn; String get createdBy; String get modifiedBy; bool get isDeleted; String get ownerId; String get type; String get value;
/// Create a copy of PolicyData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PolicyDataCopyWith<PolicyData> get copyWith => _$PolicyDataCopyWithImpl<PolicyData>(this as PolicyData, _$identity);

  /// Serializes this PolicyData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PolicyData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdOn,modifiedOn,createdBy,modifiedBy,isDeleted,ownerId,type,value);

@override
String toString() {
  return 'PolicyData(id: $id, createdOn: $createdOn, modifiedOn: $modifiedOn, createdBy: $createdBy, modifiedBy: $modifiedBy, isDeleted: $isDeleted, ownerId: $ownerId, type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class $PolicyDataCopyWith<$Res>  {
  factory $PolicyDataCopyWith(PolicyData value, $Res Function(PolicyData) _then) = _$PolicyDataCopyWithImpl;
@useResult
$Res call({
 int id, DateTime createdOn, DateTime modifiedOn, String createdBy, String modifiedBy, bool isDeleted, String ownerId, String type, String value
});




}
/// @nodoc
class _$PolicyDataCopyWithImpl<$Res>
    implements $PolicyDataCopyWith<$Res> {
  _$PolicyDataCopyWithImpl(this._self, this._then);

  final PolicyData _self;
  final $Res Function(PolicyData) _then;

/// Create a copy of PolicyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdOn = null,Object? modifiedOn = null,Object? createdBy = null,Object? modifiedBy = null,Object? isDeleted = null,Object? ownerId = null,Object? type = null,Object? value = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdOn: null == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedOn: null == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,modifiedBy: null == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PolicyData].
extension PolicyDataPatterns on PolicyData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PolicyData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PolicyData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PolicyData value)  $default,){
final _that = this;
switch (_that) {
case _PolicyData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PolicyData value)?  $default,){
final _that = this;
switch (_that) {
case _PolicyData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime createdOn,  DateTime modifiedOn,  String createdBy,  String modifiedBy,  bool isDeleted,  String ownerId,  String type,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PolicyData() when $default != null:
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.type,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime createdOn,  DateTime modifiedOn,  String createdBy,  String modifiedBy,  bool isDeleted,  String ownerId,  String type,  String value)  $default,) {final _that = this;
switch (_that) {
case _PolicyData():
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.type,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime createdOn,  DateTime modifiedOn,  String createdBy,  String modifiedBy,  bool isDeleted,  String ownerId,  String type,  String value)?  $default,) {final _that = this;
switch (_that) {
case _PolicyData() when $default != null:
return $default(_that.id,_that.createdOn,_that.modifiedOn,_that.createdBy,_that.modifiedBy,_that.isDeleted,_that.ownerId,_that.type,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PolicyData implements PolicyData {
  const _PolicyData({required this.id, required this.createdOn, required this.modifiedOn, required this.createdBy, required this.modifiedBy, required this.isDeleted, required this.ownerId, required this.type, required this.value});
  factory _PolicyData.fromJson(Map<String, dynamic> json) => _$PolicyDataFromJson(json);

@override final  int id;
@override final  DateTime createdOn;
@override final  DateTime modifiedOn;
@override final  String createdBy;
@override final  String modifiedBy;
@override final  bool isDeleted;
@override final  String ownerId;
@override final  String type;
@override final  String value;

/// Create a copy of PolicyData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PolicyDataCopyWith<_PolicyData> get copyWith => __$PolicyDataCopyWithImpl<_PolicyData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PolicyDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PolicyData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdOn,modifiedOn,createdBy,modifiedBy,isDeleted,ownerId,type,value);

@override
String toString() {
  return 'PolicyData(id: $id, createdOn: $createdOn, modifiedOn: $modifiedOn, createdBy: $createdBy, modifiedBy: $modifiedBy, isDeleted: $isDeleted, ownerId: $ownerId, type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class _$PolicyDataCopyWith<$Res> implements $PolicyDataCopyWith<$Res> {
  factory _$PolicyDataCopyWith(_PolicyData value, $Res Function(_PolicyData) _then) = __$PolicyDataCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime createdOn, DateTime modifiedOn, String createdBy, String modifiedBy, bool isDeleted, String ownerId, String type, String value
});




}
/// @nodoc
class __$PolicyDataCopyWithImpl<$Res>
    implements _$PolicyDataCopyWith<$Res> {
  __$PolicyDataCopyWithImpl(this._self, this._then);

  final _PolicyData _self;
  final $Res Function(_PolicyData) _then;

/// Create a copy of PolicyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdOn = null,Object? modifiedOn = null,Object? createdBy = null,Object? modifiedBy = null,Object? isDeleted = null,Object? ownerId = null,Object? type = null,Object? value = null,}) {
  return _then(_PolicyData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdOn: null == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedOn: null == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,modifiedBy: null == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
