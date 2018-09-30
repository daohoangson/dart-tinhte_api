import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: "post_attachment_count")
  int attachmentCount;

  @JsonKey(name: "post_body")
  String body;

  @JsonKey(name: "post_body_html")
  String bodyHtml;

  @JsonKey(name: "post_body_plain_text")
  String bodyPlainText;

  @JsonKey(name: "post_create_date")
  int createDate;

  @JsonKey(name: "post_id")
  final int id;

  @JsonKey(name: "post_is_deleted")
  bool isDeleted;

  @JsonKey(name: "post_is_first_post")
  bool isFirstPost;

  @JsonKey(name: "post_is_liked")
  bool isLiked;

  @JsonKey(name: "post_is_published")
  bool isPublished;

  @JsonKey(name: "post_like_count")
  int likeCount;

  PostLinks links;

  PostPermissions permissions;

  @JsonKey(name: "poster_user_id")
  int posterUserId;

  @JsonKey(name: "poster_username")
  String posterUsername;

  String signature;

  @JsonKey(name: "signature_html")
  String signatureHtml;

  @JsonKey(name: "signature_plain_text")
  String signaturePlainText;

  @JsonKey(name: "thread_id")
  int threadId;

  @JsonKey(name: "post_update_date")
  int updateDate;

  @JsonKey(name: "user_is_ignored")
  bool userIsIgnored;

  Post(this.id);
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class PostLinks {
  String attachments;

  String detail;

  String likes;

  String permalink;

  String poster;

  @JsonKey(name: "poster_avatar")
  String poster_avatar;

  String report;

  String thread;

  PostLinks();
  factory PostLinks.fromJson(Map<String, dynamic> json) =>
      _$PostLinksFromJson(json);
  Map<String, dynamic> toJson() => _$PostLinksToJson(this);
}

@JsonSerializable()
class PostPermissions {
  bool delete;

  bool edit;

  bool like;

  bool reply;

  bool report;

  @JsonKey(name: "upload_attachment")
  bool uploadAttachment;

  bool view;

  PostPermissions();
  factory PostPermissions.fromJson(Map<String, dynamic> json) =>
      _$PostPermissionsFromJson(json);
  Map<String, dynamic> toJson() => _$PostPermissionsToJson(this);
}
