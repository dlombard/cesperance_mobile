///
//  Generated code. Do not modify.
//  source: ce.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;

import 'package:grpc/grpc.dart';

import 'ce.pb.dart';
import 'google/protobuf/empty.pb.dart' as $0;
export 'ce.pb.dart';

class CeGrpcClient extends Client {
  static final _$getSongs = new ClientMethod<SongFilter, SongReply>(
      '/routeguide.CeGrpc/GetSongs',
      (SongFilter value) => value.writeToBuffer(),
      (List<int> value) => new SongReply.fromBuffer(value));
  static final _$getSongById = new ClientMethod<Id, SongReply>(
      '/routeguide.CeGrpc/GetSongById',
      (Id value) => value.writeToBuffer(),
      (List<int> value) => new SongReply.fromBuffer(value));
  static final _$getSongsUpdatedSince =
      new ClientMethod<UpdateDateTime, SongReply>(
          '/routeguide.CeGrpc/GetSongsUpdatedSince',
          (UpdateDateTime value) => value.writeToBuffer(),
          (List<int> value) => new SongReply.fromBuffer(value));
  static final _$dump = new ClientMethod<$0.Empty, SongReply>(
      '/routeguide.CeGrpc/Dump',
      ($0.Empty value) => value.writeToBuffer(),
      (List<int> value) => new SongReply.fromBuffer(value));

  CeGrpcClient(ClientChannel channel, {CallOptions options})
      : super(channel, options: options);

  ResponseStream<SongReply> getSongs(SongFilter request,
      {CallOptions options}) {
    final call = $createCall(
        _$getSongs, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseStream(call);
  }

  ResponseFuture<SongReply> getSongById(Id request, {CallOptions options}) {
    final call = $createCall(
        _$getSongById, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseStream<SongReply> getSongsUpdatedSince(UpdateDateTime request,
      {CallOptions options}) {
    final call = $createCall(
        _$getSongsUpdatedSince, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseStream(call);
  }

  ResponseStream<SongReply> dump($0.Empty request, {CallOptions options}) {
    final call = $createCall(_$dump, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseStream(call);
  }
}

abstract class CeGrpcServiceBase extends Service {
  String get $name => 'routeguide.CeGrpc';

  CeGrpcServiceBase() {
    $addMethod(new ServiceMethod<SongFilter, SongReply>(
        'GetSongs',
        getSongs_Pre,
        false,
        true,
        (List<int> value) => new SongFilter.fromBuffer(value),
        (SongReply value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<Id, SongReply>(
        'GetSongById',
        getSongById_Pre,
        false,
        false,
        (List<int> value) => new Id.fromBuffer(value),
        (SongReply value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<UpdateDateTime, SongReply>(
        'GetSongsUpdatedSince',
        getSongsUpdatedSince_Pre,
        false,
        true,
        (List<int> value) => new UpdateDateTime.fromBuffer(value),
        (SongReply value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<$0.Empty, SongReply>(
        'Dump',
        dump_Pre,
        false,
        true,
        (List<int> value) => new $0.Empty.fromBuffer(value),
        (SongReply value) => value.writeToBuffer()));
  }

  $async.Stream<SongReply> getSongs_Pre(
      ServiceCall call, $async.Future request) async* {
    yield* getSongs(call, (await request) as SongFilter);
  }

  $async.Future<SongReply> getSongById_Pre(
      ServiceCall call, $async.Future request) async {
    return getSongById(call, await request);
  }

  $async.Stream<SongReply> getSongsUpdatedSince_Pre(
      ServiceCall call, $async.Future request) async* {
    yield* getSongsUpdatedSince(call, (await request) as UpdateDateTime);
  }

  $async.Stream<SongReply> dump_Pre(
      ServiceCall call, $async.Future request) async* {
    yield* dump(call, (await request) as $0.Empty);
  }

  $async.Stream<SongReply> getSongs(ServiceCall call, SongFilter request);
  $async.Future<SongReply> getSongById(ServiceCall call, Id request);
  $async.Stream<SongReply> getSongsUpdatedSince(
      ServiceCall call, UpdateDateTime request);
  $async.Stream<SongReply> dump(ServiceCall call, $0.Empty request);
}
