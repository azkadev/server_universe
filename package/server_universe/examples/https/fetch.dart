// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

// import 'package:galaxeus_lib/galaxeus_lib.dart';
import 'dart:io';

import 'package:general_lib/http/http.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    HttpClient client = super.createHttpClient(context);

    // client.findProxy = (s) {
    //   return "PROXY 211.104.20.205:7820";
    // };

    // Mengabaikan validasi sertifikat SSL yang tidak valid
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

void main(List<String> arguments) async {
  HttpOverrides.global = MyHttpOverrides();
  HttpClientGeneralLib client = HttpClientGeneralLib(HttpClient());
  final res = await client.get(Uri.parse("https://slebew.dev:3000/"));
  print(res.body);
  print(res.statusCode);
}
