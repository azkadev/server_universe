// ignore_for_file: unnecessary_brace_in_string_interps

/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

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
// import 'package:server_universe_dart/edge/edge.dart';

import 'dart:io';
import 'package:general_lib/extension/dynamic.dart';
import 'package:server_universe_dart/native/native.dart';

void main() async {
  print("start");
  int port = int.tryParse(Platform.environment["PORT"] ?? "3000") ?? 3000;
  String host = Platform.environment["HOST"] ?? "0.0.0.0";
  ServerUniverseNative app = ServerUniverseNative(
    logLevel: LogType.error,
    onNotFound: (request, res) async {
      return res.status(400).send(({
        "@type": "error",
        "message": "path_not_found",
        "description": "PATH: Not Found",
      }.toStringifyPretty()));
    },
  );
  app.all("/", (req, res) {
    return res.status(200).send("oke");
  });

  int count = 0;
  app.all("/version", (req, res) async {
    count++;
    return await res.status(200).send("\nCOUNT: ${count}");
  });
  await app.listen(port, host);
  print("Server on");
}
