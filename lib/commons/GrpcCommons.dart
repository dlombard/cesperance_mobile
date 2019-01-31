import 'package:grpc/grpc.dart';

class GrpcClientSingleton {
  ClientChannel channel;
  static final GrpcClientSingleton _singleton =
  new GrpcClientSingleton._internal();

  factory GrpcClientSingleton() => _singleton;

  GrpcClientSingleton._internal() {
    try{

      channel = ClientChannel("grpc.cesperance.com", // Your IP here, localhost might not work.
          port: 1443,
          options: ChannelOptions(
            //TODO: Change to secure with server certificates
            credentials: ChannelCredentials.secure(),
            idleTimeout: Duration(minutes: 1),
          ));

    }
    catch(e){
      print('CONNECTION ERROR TO GRPC');
      print(e.toString());
    }

  }
}

