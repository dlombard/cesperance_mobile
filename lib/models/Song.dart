import 'package:json_annotation/json_annotation.dart';
part 'Song.g.dart';

@JsonSerializable()
class Song {
  Song(
      this.id, this.title, this.num, this.language, this.markdown_lyrics, this.html_lyrics, this.book_abbrv, this.created_at, this.updated_at);
  @JsonKey(name: "_id")
  String id;
  String title;
  int num;
  String language;
  String markdown_lyrics;
  String html_lyrics;
  String book_abbrv;
  String created_at;
  String updated_at;

  factory Song.fromJSON(Map<String, dynamic> json) => _$SongFromJson(json);
  Map<String, dynamic> toJson() => _$SongToJson(this);
}
