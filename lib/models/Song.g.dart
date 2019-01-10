// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
      json['_id'] as String,
      json['title'] as String,
      json['num'] as int,
      json['language'] as String,
      json['lyrics'] as String,
      json['lyrics_Markdown'] == null
          ? null
          : Lyrics.fromJson(json['lyrics_Markdown'] as Map<String, dynamic>),
      json['book'] == null
          ? null
          : Book.fromJson(json['book'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'num': instance.num,
      'language': instance.language,
      'lyrics': instance.lyrics,
      'lyrics_Markdown': instance.mdlyrics,
      'book': instance.book
    };
