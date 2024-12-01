import 'package:json_annotation/json_annotation.dart';
part 'get_image_model.g.dart';

@JsonSerializable()
class GetUnplashImageModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "width")
  int? width;
  @JsonKey(name: "height")
  int? height;
  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "blur_hash")
  String? blurHash;
  @JsonKey(name: "likes")
  int? likes;
  @JsonKey(name: "liked_by_user")
  bool? likedByUser;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "user")
  User? user;
  @JsonKey(name: "current_user_collections")
  List<CurrentUserCollection>? currentUserCollections;
  @JsonKey(name: "urls")
  Urls? urls;
  @JsonKey(name: "links")
  GetUnplashImageModelLinks? links;

  GetUnplashImageModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.likes,
    this.likedByUser,
    this.description,
    this.user,
    this.currentUserCollections,
    this.urls,
    this.links,
  });

  factory GetUnplashImageModel.fromJson(Map<String, dynamic> json) =>
      _$GetUnplashImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUnplashImageModelToJson(this);
}

@JsonSerializable()
class CurrentUserCollection {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "published_at")
  DateTime? publishedAt;
  @JsonKey(name: "last_collected_at")
  DateTime? lastCollectedAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "cover_photo")
  dynamic coverPhoto;
  @JsonKey(name: "user")
  dynamic user;

  CurrentUserCollection({
    this.id,
    this.title,
    this.publishedAt,
    this.lastCollectedAt,
    this.updatedAt,
    this.coverPhoto,
    this.user,
  });

  factory CurrentUserCollection.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUserCollectionToJson(this);
}

@JsonSerializable()
class GetUnplashImageModelLinks {
  @JsonKey(name: "self")
  String? self;
  @JsonKey(name: "html")
  String? html;
  @JsonKey(name: "download")
  String? download;
  @JsonKey(name: "download_location")
  String? downloadLocation;

  GetUnplashImageModelLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  factory GetUnplashImageModelLinks.fromJson(Map<String, dynamic> json) =>
      _$GetUnplashImageModelLinksFromJson(json);

  Map<String, dynamic> toJson() => _$GetUnplashImageModelLinksToJson(this);
}

@JsonSerializable()
class Urls {
  @JsonKey(name: "raw")
  String? raw;
  @JsonKey(name: "full")
  String? full;
  @JsonKey(name: "regular")
  String? regular;
  @JsonKey(name: "small")
  String? small;
  @JsonKey(name: "thumb")
  String? thumb;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "portfolio_url")
  String? portfolioUrl;
  @JsonKey(name: "bio")
  String? bio;
  @JsonKey(name: "location")
  String? location;
  @JsonKey(name: "total_likes")
  int? totalLikes;
  @JsonKey(name: "total_photos")
  int? totalPhotos;
  @JsonKey(name: "total_collections")
  int? totalCollections;
  @JsonKey(name: "instagram_username")
  String? instagramUsername;
  @JsonKey(name: "twitter_username")
  String? twitterUsername;
  @JsonKey(name: "profile_image")
  ProfileImage? profileImage;
  @JsonKey(name: "links")
  UserLinks? links;

  User({
    this.id,
    this.username,
    this.name,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.totalLikes,
    this.totalPhotos,
    this.totalCollections,
    this.instagramUsername,
    this.twitterUsername,
    this.profileImage,
    this.links,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserLinks {
  @JsonKey(name: "self")
  String? self;
  @JsonKey(name: "html")
  String? html;
  @JsonKey(name: "photos")
  String? photos;
  @JsonKey(name: "likes")
  String? likes;
  @JsonKey(name: "portfolio")
  String? portfolio;

  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) =>
      _$UserLinksFromJson(json);

  Map<String, dynamic> toJson() => _$UserLinksToJson(this);
}

@JsonSerializable()
class ProfileImage {
  @JsonKey(name: "small")
  String? small;
  @JsonKey(name: "medium")
  String? medium;
  @JsonKey(name: "large")
  String? large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileImageToJson(this);
}
