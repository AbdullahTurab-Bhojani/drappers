// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drappers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppLoadingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppLoadingState()';
}


}

/// @nodoc
class $AppLoadingStateCopyWith<$Res>  {
$AppLoadingStateCopyWith(AppLoadingState _, $Res Function(AppLoadingState) __);
}


/// Adds pattern-matching-related methods to [AppLoadingState].
extension AppLoadingStatePatterns on AppLoadingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialState value)?  initial,TResult Function( _LoadingState value)?  loading,TResult Function( _SuccessState value)?  success,TResult Function( _ErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _LoadingState() when loading != null:
return loading(_that);case _SuccessState() when success != null:
return success(_that);case _ErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialState value)  initial,required TResult Function( _LoadingState value)  loading,required TResult Function( _SuccessState value)  success,required TResult Function( _ErrorState value)  error,}){
final _that = this;
switch (_that) {
case _InitialState():
return initial(_that);case _LoadingState():
return loading(_that);case _SuccessState():
return success(_that);case _ErrorState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialState value)?  initial,TResult? Function( _LoadingState value)?  loading,TResult? Function( _SuccessState value)?  success,TResult? Function( _ErrorState value)?  error,}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _LoadingState() when loading != null:
return loading(_that);case _SuccessState() when success != null:
return success(_that);case _ErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( dynamic data)?  success,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _LoadingState() when loading != null:
return loading();case _SuccessState() when success != null:
return success(_that.data);case _ErrorState() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( dynamic data)  success,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case _InitialState():
return initial();case _LoadingState():
return loading();case _SuccessState():
return success(_that.data);case _ErrorState():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( dynamic data)?  success,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _LoadingState() when loading != null:
return loading();case _SuccessState() when success != null:
return success(_that.data);case _ErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _InitialState implements AppLoadingState {
  const _InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppLoadingState.initial()';
}


}




/// @nodoc


class _LoadingState implements AppLoadingState {
  const _LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppLoadingState.loading()';
}


}




/// @nodoc


class _SuccessState implements AppLoadingState {
  const _SuccessState(this.data);
  

 final  dynamic data;

/// Create a copy of AppLoadingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessStateCopyWith<_SuccessState> get copyWith => __$SuccessStateCopyWithImpl<_SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessState&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AppLoadingState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SuccessStateCopyWith<$Res> implements $AppLoadingStateCopyWith<$Res> {
  factory _$SuccessStateCopyWith(_SuccessState value, $Res Function(_SuccessState) _then) = __$SuccessStateCopyWithImpl;
@useResult
$Res call({
 dynamic data
});




}
/// @nodoc
class __$SuccessStateCopyWithImpl<$Res>
    implements _$SuccessStateCopyWith<$Res> {
  __$SuccessStateCopyWithImpl(this._self, this._then);

  final _SuccessState _self;
  final $Res Function(_SuccessState) _then;

/// Create a copy of AppLoadingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_SuccessState(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class _ErrorState implements AppLoadingState {
  const _ErrorState([this.message]);
  

 final  String? message;

/// Create a copy of AppLoadingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorStateCopyWith<_ErrorState> get copyWith => __$ErrorStateCopyWithImpl<_ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppLoadingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorStateCopyWith<$Res> implements $AppLoadingStateCopyWith<$Res> {
  factory _$ErrorStateCopyWith(_ErrorState value, $Res Function(_ErrorState) _then) = __$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$ErrorStateCopyWithImpl<$Res>
    implements _$ErrorStateCopyWith<$Res> {
  __$ErrorStateCopyWithImpl(this._self, this._then);

  final _ErrorState _self;
  final $Res Function(_ErrorState) _then;

/// Create a copy of AppLoadingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_ErrorState(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
