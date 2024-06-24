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
import 'dart:io';
import 'dart:math';

import 'package:path/path.dart' as p;
import 'package:server_universe/core/log_level.dart';

import '../server_universe_native_exception.dart';
import '../body_parser/http_body.dart';
import '../extensions/request_helpers.dart';
import '../extensions/response_helpers.dart';
import 'type_handler.dart';

TypeHandler get directoryTypeHandler => TypeHandler<Directory>((req, res, Directory directory) async {
      directory = directory.absolute;
      final usedRoute = req.route;
      String? virtualPath;
      if (usedRoute.contains('*')) {
        virtualPath = req.uri.path.substring(min(req.uri.path.length, usedRoute.indexOf('*')));
      }

      if (req.method == 'GET' || req.method == 'HEAD') {
        assert(usedRoute.contains('*'), 'TypeHandler of type Directory  GET request needs a route declaration that contains a wildcard (*). Found: $usedRoute');

        final filePath = '${directory.path}/${Uri.decodeComponent(virtualPath!)}';

        req.preventTraversal(filePath, directory);

        req.log(() => 'Resolve virtual path: $virtualPath');

        final fileCandidates = <File>[
          File(filePath),
          File('$filePath/index.html'),
          File('$filePath/index.htm'),
        ];

        try {
          var match = fileCandidates.firstWhere((file) => file.existsSync());
          req.log(() => 'Respond with file: ${match.path}');
          await _respondWithFile(res, match, headerOnly: req.method == 'HEAD');
        } on StateError {
          req.log(() => 'Could not match with any file. Expected file at: $filePath');
        }
      }
      if (req.method == 'POST' || req.method == 'PUT') {
        //Upload file
        final body = await req.body;

        if (body is Map && body['file'] is HttpBodyFileUpload) {
          if (virtualPath != null) {
            req.preventTraversal('${directory.path}/$virtualPath', directory);
            directory = Directory('${directory.path}/$virtualPath').absolute;
          }
          if (await directory.exists() == false) {
            await directory.create(recursive: true);
          }
          final fileName = (body['file'] as HttpBodyFileUpload).filename;

          final fileToWrite = File('${directory.path}/$fileName');

          req.preventTraversal(fileToWrite.path, directory);

          await fileToWrite.writeAsBytes((body['file'] as HttpBodyFileUpload).content as List<int>);
          final publicPath = "${req.requestedUri.toString() + (virtualPath != null ? '/$virtualPath' : '')}/$fileName";
          req.log(() => 'Uploaded file $publicPath');

          await res.json({'path': publicPath});
        }
      }
      if (req.method == 'DELETE') {
        final fileToDelete = File('${directory.path}/${Uri.decodeComponent(virtualPath!)}');

        req.preventTraversal(fileToDelete.path, directory);

        if (await fileToDelete.exists()) {
          await fileToDelete.delete();
          await res.json({'success': 'true'});
        } else {
          res.statusCode = 404;
          await res.json({'error': 'file not found'});
        }
      }
    });

Future _respondWithFile(HttpResponse res, File file, {bool headerOnly = false}) async {
  res.setContentTypeFromFile(file);

  // This is necessary to deal with 'HEAD' requests
  if (headerOnly == false) {
    await res.addStream(file.openRead());
  }
  await res.close();
}

extension _Logger on HttpRequest {
  void log(String Function() msgFn) => server_universe.logWriter(() => 'DirectoryTypeHandler: ${msgFn()}', LogType.debug);

  void preventTraversal(String filePath, Directory absDir) {
    final check = File(filePath).absolute;
    final absDirPath = p.canonicalize(absDir.path);
    if (!p.canonicalize(check.path).startsWith(absDirPath)) {
      log(() => 'Server directory traversal attempt: ${check.path}');
      throw ServerUniverseException(403, '403 forbidden');
    }
  }
}
