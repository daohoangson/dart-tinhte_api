import 'package:json_annotation/json_annotation.dart';

part 'oauth_token.g.dart';

@JsonSerializable()
class OauthToken {
  @JsonKey(name: "access_token")
  final String accessToken;

  @JsonKey(name: "expires_in", fromJson: int.parse)
  final int expiresIn;

  @JsonKey(name: "refresh_token")
  final String refreshToken;

  final String scope;

  @JsonKey(name: "user_id")
  final int userId;

  OauthToken(this.accessToken, this.expiresIn, this.refreshToken, this.scope,
      this.userId);
  factory OauthToken.fromJson(Map<String, dynamic> json) =>
      _$OauthTokenFromJson(json);
  Map<String, dynamic> toJson() => _$OauthTokenToJson(this);
}
