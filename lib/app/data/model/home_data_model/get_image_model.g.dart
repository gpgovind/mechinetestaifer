// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUnplashImageModel _$GetUnplashImageModelFromJson(
        Map<String, dynamic> json) =>
    GetUnplashImageModel(
      id: json['id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      color: json['color'] as String?,
      blurHash: json['blur_hash'] as String?,
      likes: (json['likes'] as num?)?.toInt(),
      likedByUser: json['liked_by_user'] as bool?,
      description: json['description'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      currentUserCollections: (json['current_user_collections']
              as List<dynamic>?)
          ?.map(
              (e) => CurrentUserCollection.fromJson(e as Map<String, dynamic>))
          .toList(),
      urls: json['urls'] == null
          ? null
          : Urls.fromJson(json['urls'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : GetUnplashImageModelLinks.fromJson(
              json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUnplashImageModelToJson(
        GetUnplashImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'blur_hash': instance.blurHash,
      'likes': instance.likes,
      'liked_by_user': instance.likedByUser,
      'description': instance.description,
      'user': instance.user,
      'current_user_collections': instance.currentUserCollections,
      'urls': instance.urls,
      'links': instance.links,
    };

CurrentUserCollection _$CurrentUserCollectionFromJson(
        Map<String, dynamic> json) =>
    CurrentUserCollection(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      publishedAt: json['published_at'] == null
          ? null
          : DateTime.parse(json['published_at'] as String),
      lastCollectedAt: json['last_collected_at'] == null
          ? null
          : DateTime.parse(json['last_collected_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      coverPhoto: json['cover_photo'],
      user: json['user'],
    );

Map<String, dynamic> _$CurrentUserCollectionToJson(
        CurrentUserCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'published_at': instance.publishedAt?.toIso8601String(),
      'last_collected_at': instance.lastCollectedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'cover_photo': instance.coverPhoto,
      'user': instance.user,
    };

GetUnplashImageModelLinks _$GetUnplashImageModelLinksFromJson(
        Map<String, dynamic> json) =>
    GetUnplashImageModelLinks(
      self: json['self'] as String?,
      html: json['html'] as String?,
      download: json['download'] as String?,
      downloadLocation: json['download_location'] as String?,
    );

Map<String, dynamic> _$GetUnplashImageModelLinksToJson(
        GetUnplashImageModelLinks instance) =>
    <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'download': instance.download,
      'download_location': instance.downloadLocation,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      raw: json['raw'] as String?,
      full: json['full'] as String?,
      regular: json['regular'] as String?,
      small: json['small'] as String?,
      thumb: json['thumb'] as String?,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      portfolioUrl: json['portfolio_url'] as String?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      totalLikes: (json['total_likes'] as num?)?.toInt(),
      totalPhotos: (json['total_photos'] as num?)?.toInt(),
      totalCollections: (json['total_collections'] as num?)?.toInt(),
      instagramUsername: json['instagram_username'] as String?,
      twitterUsername: json['twitter_username'] as String?,
      profileImage: json['profile_image'] == null
          ? null
          : ProfileImage.fromJson(
              json['profile_image'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : UserLinks.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'portfolio_url': instance.portfolioUrl,
      'bio': instance.bio,
      'location': instance.location,
      'total_likes': instance.totalLikes,
      'total_photos': instance.totalPhotos,
      'total_collections': instance.totalCollections,
      'instagram_username': instance.instagramUsername,
      'twitter_username': instance.twitterUsername,
      'profile_image': instance.profileImage,
      'links': instance.links,
    };

UserLinks _$UserLinksFromJson(Map<String, dynamic> json) => UserLinks(
      self: json['self'] as String?,
      html: json['html'] as String?,
      photos: json['photos'] as String?,
      likes: json['likes'] as String?,
      portfolio: json['portfolio'] as String?,
    );

Map<String, dynamic> _$UserLinksToJson(UserLinks instance) => <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'photos': instance.photos,
      'likes': instance.likes,
      'portfolio': instance.portfolio,
    };

ProfileImage _$ProfileImageFromJson(Map<String, dynamic> json) => ProfileImage(
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$ProfileImageToJson(ProfileImage instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };
