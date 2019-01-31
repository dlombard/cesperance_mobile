///
//  Generated code. Do not modify.
//  source: ce.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class SongFilter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('SongFilter', package: const $pb.PackageName('routeguide'))
    ..aOS(1, 'bookAbbrv')
    ..aOS(2, 'language')
    ..a<int>(3, 'num', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  SongFilter() : super();
  SongFilter.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SongFilter.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SongFilter clone() => new SongFilter()..mergeFromMessage(this);
  SongFilter copyWith(void Function(SongFilter) updates) => super.copyWith((message) => updates(message as SongFilter));
  $pb.BuilderInfo get info_ => _i;
  static SongFilter create() => new SongFilter();
  SongFilter createEmptyInstance() => create();
  static $pb.PbList<SongFilter> createRepeated() => new $pb.PbList<SongFilter>();
  static SongFilter getDefault() => _defaultInstance ??= create()..freeze();
  static SongFilter _defaultInstance;
  static void $checkItem(SongFilter v) {
    if (v is! SongFilter) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get bookAbbrv => $_getS(0, '');
  set bookAbbrv(String v) { $_setString(0, v); }
  bool hasBookAbbrv() => $_has(0);
  void clearBookAbbrv() => clearField(1);

  String get language => $_getS(1, '');
  set language(String v) { $_setString(1, v); }
  bool hasLanguage() => $_has(1);
  void clearLanguage() => clearField(2);

  int get num => $_get(2, 0);
  set num(int v) { $_setSignedInt32(2, v); }
  bool hasNum() => $_has(2);
  void clearNum() => clearField(3);
}

class Id extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Id', package: const $pb.PackageName('routeguide'))
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  Id() : super();
  Id.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Id.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Id clone() => new Id()..mergeFromMessage(this);
  Id copyWith(void Function(Id) updates) => super.copyWith((message) => updates(message as Id));
  $pb.BuilderInfo get info_ => _i;
  static Id create() => new Id();
  Id createEmptyInstance() => create();
  static $pb.PbList<Id> createRepeated() => new $pb.PbList<Id>();
  static Id getDefault() => _defaultInstance ??= create()..freeze();
  static Id _defaultInstance;
  static void $checkItem(Id v) {
    if (v is! Id) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get id => $_getS(0, '');
  set id(String v) { $_setString(0, v); }
  bool hasId() => $_has(0);
  void clearId() => clearField(1);
}

class SongReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('SongReply', package: const $pb.PackageName('routeguide'))
    ..aOS(1, 'iD')
    ..aOS(2, 'bookAbbrv')
    ..aOS(3, 'language')
    ..a<int>(4, 'num', $pb.PbFieldType.O3)
    ..aOS(5, 'title')
    ..aOS(6, 'markdownLyrics')
    ..aOS(7, 'htmlLyrics')
    ..aInt64(8, 'createdAt')
    ..aInt64(9, 'updatedAt')
    ..hasRequiredFields = false
  ;

  SongReply() : super();
  SongReply.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SongReply.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SongReply clone() => new SongReply()..mergeFromMessage(this);
  SongReply copyWith(void Function(SongReply) updates) => super.copyWith((message) => updates(message as SongReply));
  $pb.BuilderInfo get info_ => _i;
  static SongReply create() => new SongReply();
  SongReply createEmptyInstance() => create();
  static $pb.PbList<SongReply> createRepeated() => new $pb.PbList<SongReply>();
  static SongReply getDefault() => _defaultInstance ??= create()..freeze();
  static SongReply _defaultInstance;
  static void $checkItem(SongReply v) {
    if (v is! SongReply) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get iD => $_getS(0, '');
  set iD(String v) { $_setString(0, v); }
  bool hasID() => $_has(0);
  void clearID() => clearField(1);

  String get bookAbbrv => $_getS(1, '');
  set bookAbbrv(String v) { $_setString(1, v); }
  bool hasBookAbbrv() => $_has(1);
  void clearBookAbbrv() => clearField(2);

  String get language => $_getS(2, '');
  set language(String v) { $_setString(2, v); }
  bool hasLanguage() => $_has(2);
  void clearLanguage() => clearField(3);

  int get num => $_get(3, 0);
  set num(int v) { $_setSignedInt32(3, v); }
  bool hasNum() => $_has(3);
  void clearNum() => clearField(4);

  String get title => $_getS(4, '');
  set title(String v) { $_setString(4, v); }
  bool hasTitle() => $_has(4);
  void clearTitle() => clearField(5);

  String get markdownLyrics => $_getS(5, '');
  set markdownLyrics(String v) { $_setString(5, v); }
  bool hasMarkdownLyrics() => $_has(5);
  void clearMarkdownLyrics() => clearField(6);

  String get htmlLyrics => $_getS(6, '');
  set htmlLyrics(String v) { $_setString(6, v); }
  bool hasHtmlLyrics() => $_has(6);
  void clearHtmlLyrics() => clearField(7);

  Int64 get createdAt => $_getI64(7);
  set createdAt(Int64 v) { $_setInt64(7, v); }
  bool hasCreatedAt() => $_has(7);
  void clearCreatedAt() => clearField(8);

  Int64 get updatedAt => $_getI64(8);
  set updatedAt(Int64 v) { $_setInt64(8, v); }
  bool hasUpdatedAt() => $_has(8);
  void clearUpdatedAt() => clearField(9);
}

class UpdateDateTime extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('UpdateDateTime', package: const $pb.PackageName('routeguide'))
    ..aInt64(1, 'lastUpdate')
    ..hasRequiredFields = false
  ;

  UpdateDateTime() : super();
  UpdateDateTime.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UpdateDateTime.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UpdateDateTime clone() => new UpdateDateTime()..mergeFromMessage(this);
  UpdateDateTime copyWith(void Function(UpdateDateTime) updates) => super.copyWith((message) => updates(message as UpdateDateTime));
  $pb.BuilderInfo get info_ => _i;
  static UpdateDateTime create() => new UpdateDateTime();
  UpdateDateTime createEmptyInstance() => create();
  static $pb.PbList<UpdateDateTime> createRepeated() => new $pb.PbList<UpdateDateTime>();
  static UpdateDateTime getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateDateTime _defaultInstance;
  static void $checkItem(UpdateDateTime v) {
    if (v is! UpdateDateTime) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  Int64 get lastUpdate => $_getI64(0);
  set lastUpdate(Int64 v) { $_setInt64(0, v); }
  bool hasLastUpdate() => $_has(0);
  void clearLastUpdate() => clearField(1);
}

