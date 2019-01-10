import 'package:json_annotation/json_annotation.dart';
import 'package:startup_namer/models/Lyrics.dart';
import 'Book.dart';
part 'Song.g.dart';

@JsonSerializable()
class Song {
  Song(
      this.id, this.title, this.num, this.language, this.lyrics, this.mdlyrics, this.book);
  @JsonKey(name: "_id")
  String id;
  String title;
  int num;
  String language;
  String lyrics;
  @JsonKey(name: "lyrics_Markdown")
  Lyrics mdlyrics;
  Book book;

  factory Song.fromJSON(Map<String, dynamic> json) => _$SongFromJson(json);
  Map<String, dynamic> toJson() => _$SongToJson(this);
}
