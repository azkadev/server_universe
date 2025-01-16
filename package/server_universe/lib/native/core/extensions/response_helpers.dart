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
import 'dart:async';
import 'dart:convert';
import 'dart:io';
 
import 'package:server_universe/fork/mime_type/mime_type.dart';

import 'file_helpers.dart';

/// A set of extensions on the [HttpResponse] object, mostly for convenience
///
extension ResponseHelpers on HttpResponse {
  /// Set the appropriate headers to download the file
  ///
  void setDownload({required String filename}) {
    headers.add('Content-Disposition', 'attachment; filename=$filename');
  }

  /// Set the content type from the extension ie. 'pdf'
  ///
  void setContentTypeFromExtension(String extension) {
    final mime = mimeFromExtension(extension);
    if (mime != null) {
      final split = mime.split('/');
      headers.contentType = ContentType(split[0], split[1]);
    }
  }

  /// Set the content type given a file
  ///
  void setContentTypeFromFile(File file) {
    final setContentType = headers.contentType;

    if (setContentType == null || setContentType.mimeType == 'text/plain') {
      final fileContentType = file.contentType;
      if (fileContentType != null) {
        headers.contentType = file.contentType;
      } else {
        final extension = file.path.split('.').last;
        final suggestedMime = mimeFromExtension(extension);
        if (suggestedMime != null) {
          setContentTypeFromExtension(extension);
        } else {
          headers.contentType = ContentType.binary;
        }
      }
    }
  }

  /// Helper method for those used to res.json()
  ///
  FutureOr<dynamic> json(Object? json) async {
    headers.contentType = ContentType.json;
    write(jsonEncode(json));
    return await close();
  }

  /// ServerUniverseUncompleteDocumentation
  HttpResponse status(int value) {
    statusCode = value;
    return this;
  }

  /// Helper method to just send data;
  FutureOr<dynamic> send(Object? data) async {
    write(data);
    return await close();
  }
}
