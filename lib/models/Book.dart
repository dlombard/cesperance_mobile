import 'package:json_annotation/json_annotation.dart';
part 'Book.g.dart';
@JsonSerializable()
class Book{
  const Book({
    this.name,
    this.abbrv,
  });
  final name;
  final abbrv;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}