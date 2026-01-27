// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StartupModel {

 int get id; String get startupTitle; String get startupSubTitle; String get startupExpertise; String get founderName; String get founderTitle; String get founderPictureUrl; String get founded; String get teamSize; String get fundingStage; String get website; String get aboutStartup; String get videoLink; String? get thumbnailUrl; String? get featureEpisode; bool? get isLikedByUser;
/// Create a copy of StartupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartupModelCopyWith<StartupModel> get copyWith => _$StartupModelCopyWithImpl<StartupModel>(this as StartupModel, _$identity);

  /// Serializes this StartupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.startupTitle, startupTitle) || other.startupTitle == startupTitle)&&(identical(other.startupSubTitle, startupSubTitle) || other.startupSubTitle == startupSubTitle)&&(identical(other.startupExpertise, startupExpertise) || other.startupExpertise == startupExpertise)&&(identical(other.founderName, founderName) || other.founderName == founderName)&&(identical(other.founderTitle, founderTitle) || other.founderTitle == founderTitle)&&(identical(other.founderPictureUrl, founderPictureUrl) || other.founderPictureUrl == founderPictureUrl)&&(identical(other.founded, founded) || other.founded == founded)&&(identical(other.teamSize, teamSize) || other.teamSize == teamSize)&&(identical(other.fundingStage, fundingStage) || other.fundingStage == fundingStage)&&(identical(other.website, website) || other.website == website)&&(identical(other.aboutStartup, aboutStartup) || other.aboutStartup == aboutStartup)&&(identical(other.videoLink, videoLink) || other.videoLink == videoLink)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.featureEpisode, featureEpisode) || other.featureEpisode == featureEpisode)&&(identical(other.isLikedByUser, isLikedByUser) || other.isLikedByUser == isLikedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startupTitle,startupSubTitle,startupExpertise,founderName,founderTitle,founderPictureUrl,founded,teamSize,fundingStage,website,aboutStartup,videoLink,thumbnailUrl,featureEpisode,isLikedByUser);

@override
String toString() {
  return 'StartupModel(id: $id, startupTitle: $startupTitle, startupSubTitle: $startupSubTitle, startupExpertise: $startupExpertise, founderName: $founderName, founderTitle: $founderTitle, founderPictureUrl: $founderPictureUrl, founded: $founded, teamSize: $teamSize, fundingStage: $fundingStage, website: $website, aboutStartup: $aboutStartup, videoLink: $videoLink, thumbnailUrl: $thumbnailUrl, featureEpisode: $featureEpisode, isLikedByUser: $isLikedByUser)';
}


}

/// @nodoc
abstract mixin class $StartupModelCopyWith<$Res>  {
  factory $StartupModelCopyWith(StartupModel value, $Res Function(StartupModel) _then) = _$StartupModelCopyWithImpl;
@useResult
$Res call({
 int id, String startupTitle, String startupSubTitle, String startupExpertise, String founderName, String founderTitle, String founderPictureUrl, String founded, String teamSize, String fundingStage, String website, String aboutStartup, String videoLink, String? thumbnailUrl, String? featureEpisode, bool? isLikedByUser
});




}
/// @nodoc
class _$StartupModelCopyWithImpl<$Res>
    implements $StartupModelCopyWith<$Res> {
  _$StartupModelCopyWithImpl(this._self, this._then);

  final StartupModel _self;
  final $Res Function(StartupModel) _then;

/// Create a copy of StartupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startupTitle = null,Object? startupSubTitle = null,Object? startupExpertise = null,Object? founderName = null,Object? founderTitle = null,Object? founderPictureUrl = null,Object? founded = null,Object? teamSize = null,Object? fundingStage = null,Object? website = null,Object? aboutStartup = null,Object? videoLink = null,Object? thumbnailUrl = freezed,Object? featureEpisode = freezed,Object? isLikedByUser = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startupTitle: null == startupTitle ? _self.startupTitle : startupTitle // ignore: cast_nullable_to_non_nullable
as String,startupSubTitle: null == startupSubTitle ? _self.startupSubTitle : startupSubTitle // ignore: cast_nullable_to_non_nullable
as String,startupExpertise: null == startupExpertise ? _self.startupExpertise : startupExpertise // ignore: cast_nullable_to_non_nullable
as String,founderName: null == founderName ? _self.founderName : founderName // ignore: cast_nullable_to_non_nullable
as String,founderTitle: null == founderTitle ? _self.founderTitle : founderTitle // ignore: cast_nullable_to_non_nullable
as String,founderPictureUrl: null == founderPictureUrl ? _self.founderPictureUrl : founderPictureUrl // ignore: cast_nullable_to_non_nullable
as String,founded: null == founded ? _self.founded : founded // ignore: cast_nullable_to_non_nullable
as String,teamSize: null == teamSize ? _self.teamSize : teamSize // ignore: cast_nullable_to_non_nullable
as String,fundingStage: null == fundingStage ? _self.fundingStage : fundingStage // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,aboutStartup: null == aboutStartup ? _self.aboutStartup : aboutStartup // ignore: cast_nullable_to_non_nullable
as String,videoLink: null == videoLink ? _self.videoLink : videoLink // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,featureEpisode: freezed == featureEpisode ? _self.featureEpisode : featureEpisode // ignore: cast_nullable_to_non_nullable
as String?,isLikedByUser: freezed == isLikedByUser ? _self.isLikedByUser : isLikedByUser // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [StartupModel].
extension StartupModelPatterns on StartupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartupModel value)  $default,){
final _that = this;
switch (_that) {
case _StartupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartupModel value)?  $default,){
final _that = this;
switch (_that) {
case _StartupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String startupTitle,  String startupSubTitle,  String startupExpertise,  String founderName,  String founderTitle,  String founderPictureUrl,  String founded,  String teamSize,  String fundingStage,  String website,  String aboutStartup,  String videoLink,  String? thumbnailUrl,  String? featureEpisode,  bool? isLikedByUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartupModel() when $default != null:
return $default(_that.id,_that.startupTitle,_that.startupSubTitle,_that.startupExpertise,_that.founderName,_that.founderTitle,_that.founderPictureUrl,_that.founded,_that.teamSize,_that.fundingStage,_that.website,_that.aboutStartup,_that.videoLink,_that.thumbnailUrl,_that.featureEpisode,_that.isLikedByUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String startupTitle,  String startupSubTitle,  String startupExpertise,  String founderName,  String founderTitle,  String founderPictureUrl,  String founded,  String teamSize,  String fundingStage,  String website,  String aboutStartup,  String videoLink,  String? thumbnailUrl,  String? featureEpisode,  bool? isLikedByUser)  $default,) {final _that = this;
switch (_that) {
case _StartupModel():
return $default(_that.id,_that.startupTitle,_that.startupSubTitle,_that.startupExpertise,_that.founderName,_that.founderTitle,_that.founderPictureUrl,_that.founded,_that.teamSize,_that.fundingStage,_that.website,_that.aboutStartup,_that.videoLink,_that.thumbnailUrl,_that.featureEpisode,_that.isLikedByUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String startupTitle,  String startupSubTitle,  String startupExpertise,  String founderName,  String founderTitle,  String founderPictureUrl,  String founded,  String teamSize,  String fundingStage,  String website,  String aboutStartup,  String videoLink,  String? thumbnailUrl,  String? featureEpisode,  bool? isLikedByUser)?  $default,) {final _that = this;
switch (_that) {
case _StartupModel() when $default != null:
return $default(_that.id,_that.startupTitle,_that.startupSubTitle,_that.startupExpertise,_that.founderName,_that.founderTitle,_that.founderPictureUrl,_that.founded,_that.teamSize,_that.fundingStage,_that.website,_that.aboutStartup,_that.videoLink,_that.thumbnailUrl,_that.featureEpisode,_that.isLikedByUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StartupModel implements StartupModel {
  const _StartupModel({required this.id, required this.startupTitle, required this.startupSubTitle, required this.startupExpertise, required this.founderName, required this.founderTitle, required this.founderPictureUrl, required this.founded, required this.teamSize, required this.fundingStage, required this.website, required this.aboutStartup, required this.videoLink, this.thumbnailUrl, this.featureEpisode, this.isLikedByUser});
  factory _StartupModel.fromJson(Map<String, dynamic> json) => _$StartupModelFromJson(json);

@override final  int id;
@override final  String startupTitle;
@override final  String startupSubTitle;
@override final  String startupExpertise;
@override final  String founderName;
@override final  String founderTitle;
@override final  String founderPictureUrl;
@override final  String founded;
@override final  String teamSize;
@override final  String fundingStage;
@override final  String website;
@override final  String aboutStartup;
@override final  String videoLink;
@override final  String? thumbnailUrl;
@override final  String? featureEpisode;
@override final  bool? isLikedByUser;

/// Create a copy of StartupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartupModelCopyWith<_StartupModel> get copyWith => __$StartupModelCopyWithImpl<_StartupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.startupTitle, startupTitle) || other.startupTitle == startupTitle)&&(identical(other.startupSubTitle, startupSubTitle) || other.startupSubTitle == startupSubTitle)&&(identical(other.startupExpertise, startupExpertise) || other.startupExpertise == startupExpertise)&&(identical(other.founderName, founderName) || other.founderName == founderName)&&(identical(other.founderTitle, founderTitle) || other.founderTitle == founderTitle)&&(identical(other.founderPictureUrl, founderPictureUrl) || other.founderPictureUrl == founderPictureUrl)&&(identical(other.founded, founded) || other.founded == founded)&&(identical(other.teamSize, teamSize) || other.teamSize == teamSize)&&(identical(other.fundingStage, fundingStage) || other.fundingStage == fundingStage)&&(identical(other.website, website) || other.website == website)&&(identical(other.aboutStartup, aboutStartup) || other.aboutStartup == aboutStartup)&&(identical(other.videoLink, videoLink) || other.videoLink == videoLink)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.featureEpisode, featureEpisode) || other.featureEpisode == featureEpisode)&&(identical(other.isLikedByUser, isLikedByUser) || other.isLikedByUser == isLikedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startupTitle,startupSubTitle,startupExpertise,founderName,founderTitle,founderPictureUrl,founded,teamSize,fundingStage,website,aboutStartup,videoLink,thumbnailUrl,featureEpisode,isLikedByUser);

@override
String toString() {
  return 'StartupModel(id: $id, startupTitle: $startupTitle, startupSubTitle: $startupSubTitle, startupExpertise: $startupExpertise, founderName: $founderName, founderTitle: $founderTitle, founderPictureUrl: $founderPictureUrl, founded: $founded, teamSize: $teamSize, fundingStage: $fundingStage, website: $website, aboutStartup: $aboutStartup, videoLink: $videoLink, thumbnailUrl: $thumbnailUrl, featureEpisode: $featureEpisode, isLikedByUser: $isLikedByUser)';
}


}

/// @nodoc
abstract mixin class _$StartupModelCopyWith<$Res> implements $StartupModelCopyWith<$Res> {
  factory _$StartupModelCopyWith(_StartupModel value, $Res Function(_StartupModel) _then) = __$StartupModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String startupTitle, String startupSubTitle, String startupExpertise, String founderName, String founderTitle, String founderPictureUrl, String founded, String teamSize, String fundingStage, String website, String aboutStartup, String videoLink, String? thumbnailUrl, String? featureEpisode, bool? isLikedByUser
});




}
/// @nodoc
class __$StartupModelCopyWithImpl<$Res>
    implements _$StartupModelCopyWith<$Res> {
  __$StartupModelCopyWithImpl(this._self, this._then);

  final _StartupModel _self;
  final $Res Function(_StartupModel) _then;

/// Create a copy of StartupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startupTitle = null,Object? startupSubTitle = null,Object? startupExpertise = null,Object? founderName = null,Object? founderTitle = null,Object? founderPictureUrl = null,Object? founded = null,Object? teamSize = null,Object? fundingStage = null,Object? website = null,Object? aboutStartup = null,Object? videoLink = null,Object? thumbnailUrl = freezed,Object? featureEpisode = freezed,Object? isLikedByUser = freezed,}) {
  return _then(_StartupModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startupTitle: null == startupTitle ? _self.startupTitle : startupTitle // ignore: cast_nullable_to_non_nullable
as String,startupSubTitle: null == startupSubTitle ? _self.startupSubTitle : startupSubTitle // ignore: cast_nullable_to_non_nullable
as String,startupExpertise: null == startupExpertise ? _self.startupExpertise : startupExpertise // ignore: cast_nullable_to_non_nullable
as String,founderName: null == founderName ? _self.founderName : founderName // ignore: cast_nullable_to_non_nullable
as String,founderTitle: null == founderTitle ? _self.founderTitle : founderTitle // ignore: cast_nullable_to_non_nullable
as String,founderPictureUrl: null == founderPictureUrl ? _self.founderPictureUrl : founderPictureUrl // ignore: cast_nullable_to_non_nullable
as String,founded: null == founded ? _self.founded : founded // ignore: cast_nullable_to_non_nullable
as String,teamSize: null == teamSize ? _self.teamSize : teamSize // ignore: cast_nullable_to_non_nullable
as String,fundingStage: null == fundingStage ? _self.fundingStage : fundingStage // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,aboutStartup: null == aboutStartup ? _self.aboutStartup : aboutStartup // ignore: cast_nullable_to_non_nullable
as String,videoLink: null == videoLink ? _self.videoLink : videoLink // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,featureEpisode: freezed == featureEpisode ? _self.featureEpisode : featureEpisode // ignore: cast_nullable_to_non_nullable
as String?,isLikedByUser: freezed == isLikedByUser ? _self.isLikedByUser : isLikedByUser // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
