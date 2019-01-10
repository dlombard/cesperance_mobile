import 'package:json_annotation/json_annotation.dart';

part 'Lyrics.g.dart';

@JsonSerializable()
class Lyrics {
  Lyrics(this.md, this.html);
  String md;
  String html;

  factory Lyrics.fromJson(Map<String, dynamic> json) => _$LyricsFromJson(json);
  Map<String, dynamic> toJson() => _$LyricsToJson(this);
}
