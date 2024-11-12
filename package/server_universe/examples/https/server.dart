/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:io';
import 'package:general_lib/extension/dynamic.dart';
import 'package:server_universe/native.dart';

void main() async {
  print("start");
  int port = int.tryParse(Platform.environment["PORT"] ?? "3000") ?? 3000;
  String host = "0.0.0.10";
  ServerUniverseNative app = ServerUniverseNative(
    serverUniverseLogType: ServerUniverseLogType.error,
    onNotFound: (request, res) async {
      return res.send(({
        "@type": "error",
        "message": "path_not_found",
        "description": "PATH: Not Found",
      }.toStringifyPretty()));
    },
  );
  app.all("/", (req, res) {
    return res.send("oke");
  });

  int count = 0;
  app.all("/version", (req, res) async {
    count++;
    return await res.status(200).send("\nCOUNT: ${count}");
  });
  // await app.listen(
  //   // securityContext: salpa(),
  //   port: port,
  //   bindIp: host,
  // );

 final res = await app.listenSecure(
    securityContext: salpa(),
    port: port,
    bindIp: host,
  );

  print("Server on: ${res.address.host}");
}

SecurityContext salpa() {
  final SecurityContext securityContext = SecurityContext(withTrustedRoots: true);
  return securityContext;
}
