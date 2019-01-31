import 'package:cesperance/commons/GrpcCommons.dart';
import 'package:cesperance/models/google/protobuf/empty.pb.dart';
import 'package:cesperance/models/ce.pb.dart';
import 'package:cesperance/models/ce.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
class CeGrpcService {
  ClientChannel channel;
  CeGrpcClient client;

  CeGrpcService(){
    channel = GrpcClientSingleton().channel;
    client = new CeGrpcClient(channel);
  }

  Stream<SongReply> getSongsUpdatedSince(DateTime lastUpdate)  {
    UpdateDateTime uTime = new UpdateDateTime();
    uTime.lastUpdate =  Int64(lastUpdate.millisecondsSinceEpoch);

    CallOptions options = new CallOptions(timeout: Duration(milliseconds: 5000));
    return client.getSongsUpdatedSince(uTime, options: options);
  }
  Stream<SongReply> getSongs({String bookAbbrv, String language, int num})  {

    var request = new SongFilter();
    request.bookAbbrv = bookAbbrv;
    request.language = language;
    request.num = num;

    return client.getSongs(request);
  }
  Future<SongReply> getSongById(String id) async {
    Id idRequest = new Id();
    return await client.getSongById(idRequest);
  }
  Stream<SongReply> dump( )  {
    Stream<SongReply> res =  client.dump(Empty());
    return res;
  }
  
  /*
    $async.Stream<SongReply> getSongs(ServiceCall call, SongFilter request);
  $async.Future<SongReply> getSongById(ServiceCall call, Id request);
  $async.Stream<SongReply> getSongsUpdatedSince(
      ServiceCall call, UpdateDateTime request);
  $async.Stream<SongReply> dump(ServiceCall call, $0.Empty request);
   */
}