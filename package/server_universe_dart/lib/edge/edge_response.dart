// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, empty_catches

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
import 'dart:convert' as convert;

import 'package:general_lib/json_scheme/json_scheme.dart';
import 'package:server_universe_dart/edge/edge_lib.dart';

export 'package:server_universe_dart/edge/edge.dart';

class ServerUniverseDartFunctionResponse {
  int _status_code = 200;
  String? _status_text;
  Headers headers = Headers();
  ServerUniverseDartFunctionResponse();

  ServerUniverseDartFunctionResponse status(int status) {
    _status_code = status;
    return this;
  }

  ServerUniverseDartFunctionResponse statusText(String? status) {
    _status_text = status;
    return this;
  }

  Response json(
    Map value,
  ) {
    String body = convert.json.encode(value);
    headers.append("content-type", "application/json");

    return response(
      body: body,
      status: _status_code,
      statusText: _status_text,
      headers: headers,
    );
  }

  Response send(
    dynamic value,
  ) {
    if (value is JsonScheme) {
      return json(value.toJson());
    } else {
      return response(
        body: (value),
        status: _status_code,
        statusText: _status_text,
        headers: headers,
      );
    }
  }

  Response response({
    required dynamic body,
    required int? status,
    required String? statusText,
    required Headers? headers,
  }) {
    return Response(
      body,
      status: status,
      statusText: statusText,
      headers: headers,
    );
  }
}
