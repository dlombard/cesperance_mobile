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
      json['markdown_lyrics'] as String,
      json['html_lyrics'] as String,
      json['book_abbrv'] as String,
      json['created_at'] as String,
      json['updated_at'] as String);
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'num': instance.num,
      'language': instance.language,
      'markdown_lyrics': instance.markdown_lyrics,
      'html_lyrics': instance.html_lyrics,
      'book_abbrv': instance.book_abbrv,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at
    };
