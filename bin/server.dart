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

// import 'dart:convert';
import 'dart:io';
import 'package:alfred/alfred.dart';
import 'package:general_lib/extension/dynamic.dart';
// import 'package:server_universe_dart/native/native.dart';

void main() async {
  print("start");
  int port = int.tryParse(Platform.environment["PORT"] ?? "3000") ?? 3000;
  String host = Platform.environment["HOST"] ?? "0.0.0.0";
  Alfred app = Alfred(
    simultaneousProcessing: 10,
    onNotFound: (request, res) async {
      Map json_data = {};

      // HttpConnectionInfo? connectionInfo = request.connectionInfo;
      // if (connectionInfo != null) {
      //   json_data["addres"] = connectionInfo.remoteAddress.address;json_data["port"] = connectionInfo.remotePort;
      // }
      return res.send(({
        "@type": "error",
        "message": "path_not_found",
        "description": "PATH: Not Found",
        ...json_data,
      }.toStringifyPretty()));
    },
    onInternalError: (req, res) {
      return res.send({"@type": "error", "message": "server_crash"}.toStringifyPretty());
    },
  );
  app.all("/", (req, res) {
    return res.send("oke");
  });
  int count = 0;
  app.all("/version", (req, res) {
    count++;
    return res.send("\nCOUNT: ${count}");
  });
  await app.listen(port, host);
  print("Server on");
}