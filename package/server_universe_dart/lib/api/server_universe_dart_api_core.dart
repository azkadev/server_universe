// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, unused_local_variable

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
import 'dart:async';
import 'dart:io';

import 'package:general_lib/general_lib.dart';
import 'package:general_lib/watch/watch.dart';
import 'package:server_universe_dart/api/extensions.dart';
import 'package:server_universe_scheme/scheme/scheme/pubspec_server_universe.dart';
import "package:path/path.dart" as path;
import 'package:server_universe_scheme/scheme/scheme/pubspec_server_universe_dependencies.dart';
import 'package:server_universe_scheme/scheme/scheme/server_universe_pubspec_config.dart';
import 'package:server_universe_scheme/scheme/scheme/server_universe_pubspec_supabase_config.dart';

import "package:yaml/yaml.dart" as yaml;
import 'package:yaml_writer/yaml_writer.dart';

enum ServerUniverseDartBuildType {
  debug,
  release,
}

enum ServerUniverseDartPlatformType {
  supabase,
  vercel,
  netlify,
}

class ServerUniverseDartApi {
  ServerUniverseDartApi();

  FutureOr<dynamic> create({
    required String newName,
    required Directory directoryBase,
  }) async {
    Directory directory_project = await Future(() async {
      return Directory(Directory(path.join(directoryBase.uri.toFilePath(), newName.trim())).uri.toFilePath());
    });
    String project_name = path.basename(directory_project.path);

    File file_pubspec = File(path.join(directory_project.path, "pubspec.yaml"));
    if (!file_pubspec.existsSync()) {
      Process process = await Process.start(
        "dart",
        [
          "create",
          newName,
          "--no-pub",
          "--force",
        ],
        workingDirectory: directory_project.parent.uri.toFilePath(),
      );
      process.stderr.listen((event) {
        stderr.add(event);
      });
      process.stdout.listen((event) {
        stdout.add(event);
      });
      int exit_code = await (process.exitCode);
    }
    Map yaml_code = (yaml.loadYaml(file_pubspec.readAsStringSync(), recover: true) as Map);
    PubspecServerUniverse pubspec_server_universe = PubspecServerUniverse(yaml_code.clone());

    File file_guide = File(path.join(directory_project.path, "guide-server-universe.md"));

    await file_guide.writeAsString(guide_server_universe_markdown(
      name_project: project_name,
    ));
    // supabase file script
    File file_script_native = File(path.join(directory_project.path, "bin", "${project_name}_native.dart"));

    if (!file_script_native.existsSync()) {
      await file_script_native.writeAsString(script_server_universe_dart_native());
    }

    // supabase file script
    File file_script_supabase = File(path.join(directory_project.path, "bin", "${project_name}_supabase.dart"));

    if (!file_script_supabase.existsSync()) {
      await file_script_supabase.writeAsString(script_server_universe_dart_supabase());
    }

    // supabase directory deploy
    Directory directory_script_supabase = Directory(path.join(directory_project.path, "supabase", "functions", project_name));

    // default configuration pubspec
    PubspecServerUniverse pubspec_server_default = PubspecServerUniverse.create(
      repository: "https://github.com/azkadev/server_universe",
      homepage: "https://github.com/azkadev/server_universe",
      issue_tracker: "https://github.com/azkadev/server_universe/issues",
      documentation: "https://github.com/azkadev/server_universe/tree/main/docs",
      funding: [
        "https://github.com/sponsors/azkadev",
      ],
      dependencies: PubspecServerUniverseDependencies({
        "server_universe_dart": "any",
        "server_universe_dart_http_client": "any",
        "general_lib": "^0.0.34",
      }),
      server_universe: ServerUniversePubspecConfig.create(
        supabase: ServerUniversePubspecSupabaseConfig.create(
          input_file: path.relative(
            file_script_supabase.path,
            from: directory_project.path,
          ),
          output_directory: path.relative(
            directory_script_supabase.path,
            from: directory_project.path,
          ),
        ),
      ),
    );

    // update pubspec default
    pubspec_server_universe.rawData.server_universe_dart_updateMapIfNotSameOrEmptyOrNull(
      data: pubspec_server_default.toJson(),
      ignoreKeys: [
        "@type",
      ],
    );
    String yaml_documents_new = YamlWriter().write(pubspec_server_universe.toJson());
    await file_pubspec.writeAsString(yaml_documents_new);
    // finished update pubspec
  }

  FutureOr<int> run({
    required Directory directoryBase,
    required Directory? directoryOutputBuildServerUniverse,
    required String? inputFileName,
    required ServerUniverseDartBuildType server_universeDartBuildType,
    required ServerUniverseDartPlatformType server_universeDartPlatformType,
  }) async {
    if (Dart.isWeb) {
      return 1;
    }
    File file_pubspec = File(path.join(directoryBase.path, "pubspec.yaml"));
    if (!file_pubspec.existsSync()) {
      print("pubspec not found");
      return 1;
    }
    // build platform supabase
    if (server_universeDartPlatformType == ServerUniverseDartPlatformType.supabase) {
      Process? procces = await Future(() async {
        if (Dart.isLinux) {
          return await Process.start(
            "sudo",
            [
              "supabase",
              "functions",
              "serve",
              "--no-verify-jwt",
            ],
            workingDirectory: directoryBase.path,
          );
        }
        return null;
      });
      if (procces == null) {
        return 1;
      }
      procces.stderr.listen((event) {
        stderr.add(event);
      });
      procces.stdout.listen((event) {
        stdout.add(event);
      });
      Directory directory_bin = Directory(path.join(directoryBase.path, "bin"));
      Directory directory_lib = Directory(path.join(directoryBase.path, "lib"));
      bool is_pending_update = false;
      DateTime dateTime_expired = DateTime.now();
      void onUpdate(FileSystemEvent event) async {
        if (RegExp(r"([.]dart)$", caseSensitive: false).hasMatch(path.basename(event.path))) {
          if (is_pending_update) {
            if (dateTime_expired.isExpired() == false) {
              return;
            }
          }
          is_pending_update = true;
          dateTime_expired = DateTime.now().add(Duration(seconds: 30));

          await build(
            directoryBase: directoryBase,
            inputFileName: inputFileName,
            directoryOutputBuildServerUniverse: directoryOutputBuildServerUniverse,
            server_universeDartBuildType: server_universeDartBuildType,
            server_universeDartPlatformType: server_universeDartPlatformType,
          );
          is_pending_update = false;
        }
      }

      // old
      directory_bin.watch(recursive: true).listen(onUpdate);
      directory_lib.watch(recursive: true).listen(onUpdate);
      directory_lib.listSync().watchRecursive(onData: onUpdate);
      return await (procces.exitCode);
    }
    return 1;
  }

  FutureOr<dynamic> build({
    required Directory directoryBase,
    required Directory? directoryOutputBuildServerUniverse,
    required String? inputFileName,
    required ServerUniverseDartBuildType server_universeDartBuildType,
    required ServerUniverseDartPlatformType server_universeDartPlatformType,
  }) async {
    File file_pubspec = File(path.join(directoryBase.path, "pubspec.yaml"));
    if (!file_pubspec.existsSync()) {
      print("pubspec not found");
      return;
    }
    Map yaml_code = (yaml.loadYaml(file_pubspec.readAsStringSync(), recover: true) as Map);
    PubspecServerUniverse pubspec_server_universe = PubspecServerUniverse(yaml_code.clone());
    Directory directory_script = Directory(path.join(directoryBase.path, "bin"));
    Directory directory_build = Directory(path.join(directoryBase.path, "build"));
    if (directory_build.existsSync() == false) {
      directory_build.createSync(
        recursive: true,
      );
    }
    Directory directory_build_server_universe = Directory(path.join(directory_build.path, "server_universe"));
    if (directory_build_server_universe.existsSync() == false) {
      directory_build_server_universe.createSync(
        recursive: true,
      );
    }

    // build platform supabase
    if (server_universeDartPlatformType == ServerUniverseDartPlatformType.supabase) {
      Directory directory_build_server_universe_supabase = await Future(() async {
        Directory? directory_output_procces = directoryOutputBuildServerUniverse;
        if (directory_output_procces != null) {
          return directory_output_procces;
        }
        String output_by_condif_projge = (pubspec_server_universe.server_universe.supabase.output_directory ?? "").trim();
        if (output_by_condif_projge.isNotEmpty) {
          return Directory(output_by_condif_projge);
        }
        return Directory(path.join(directory_build_server_universe.path, "supabase"));
      });

      if (directory_build_server_universe_supabase.existsSync() == false) {
        directory_build_server_universe_supabase.createSync(
          recursive: true,
        );
      }
      File file_supabase_server_universe_script = await Future(() async {
        String supabase_script_path = (inputFileName ?? "").trim();
        if (supabase_script_path.isEmpty) {
          supabase_script_path = path.basename((pubspec_server_universe.server_universe.supabase.input_file ?? "").trim());
          if (supabase_script_path.isEmpty) {
            supabase_script_path = "${pubspec_server_universe.name}_server_universe_supabase";
          }
          if (!RegExp(r"([.]dart)$", caseSensitive: false).hasMatch(supabase_script_path)) {
            supabase_script_path = "${supabase_script_path}.dart";
          }
          return File(path.join(directory_script.path, "${supabase_script_path}"));
        } else {
          return File(supabase_script_path);
        }
      });
      if (file_supabase_server_universe_script.existsSync() == false) {
        print("Supabase Script not found: ${path.basename(file_supabase_server_universe_script.path)}");
        return;
      }
      String outputFileName = "main.dart.js";
      print("Starting Build: ${server_universeDartBuildType.name.toUpperCaseFirstData()} Platform ${server_universeDartPlatformType.name.toUpperCaseFirstData()}: ${path.relative(file_supabase_server_universe_script.path, from: directoryBase.path)}");
      //
      await compile(
        pubspecServerUniverse: pubspec_server_universe,
        server_universeDartBuildType: server_universeDartBuildType,
        file_script: file_supabase_server_universe_script,
        directoryBuild: directory_build_server_universe_supabase,
        outputFileName: outputFileName,
      );

      File file_index_ts = File(path.join(directory_build_server_universe_supabase.path, "index.ts"));
      await file_index_ts.writeAsString(script_server_universe_functions_supabase(
        fileName: outputFileName,
      ));
      print("Finished Compiled: ${directory_build_server_universe_supabase.path}");
    }

    if (server_universeDartPlatformType == ServerUniverseDartPlatformType.netlify) {}
    if (server_universeDartPlatformType == ServerUniverseDartPlatformType.vercel) {}
  }

  Future<int> compile({
    required PubspecServerUniverse pubspecServerUniverse,
    required ServerUniverseDartBuildType server_universeDartBuildType,
    required File file_script,
    required Directory directoryBuild,
    required String outputFileName,
  }) async {
    List<String> arguments = [
      "compile",
      "js",
      () {
        if (server_universeDartBuildType == ServerUniverseDartBuildType.debug) {
          return "-O0";
        }
        return "-O2";
      }(),
      "--no-frequency-based-minification",
      "--server-mode",
      file_script.path,
      "-o",
      path.join(directoryBuild.path, outputFileName),
    ];

    Process shell = await Process.start("dart", arguments);

    shell.stderr.listen((event) {
      stderr.add(event);
    });
    shell.stdout.listen((event) {
      stdout.add(event);
    });

    return await shell.exitCode;
  }

  static String script_server_universe_dart_native() {
    return r"""
import 'dart:io';

import 'package:server_universe_dart/native/native.dart';

void main() async {
  print("start");
  int port = int.tryParse(Platform.environment["PORT"] ?? "3000") ?? 3000;
  String host = Platform.environment["HOST"] ?? "0.0.0.0";
  ServerUniverseNative app = ServerUniverseNative(
    onNotFound: (req, res) async {
      
      return res.json({"@type": "error", "message": "path_not_found", "description": "PATH: Not Found"});
    },
    onInternalError: (req, res) {
      return res.json({"@type": "error", "message": "server_crash"});
    },
  );
  app.all("/", (req, res) {
    return res.send("oke");
  });
  app.all("/version", (req, res) {
    return res.json({
      "@type": "version",
      "version": "0.0.0",
    });
  });

  await app.listen(port, host);

  print("Server on");
}
"""
        .trim();
  }

  static String script_server_universe_dart_supabase() {
    return r"""
import 'package:server_universe_dart/edge/edge.dart';

void main() async {
  print("start");
  ServerUniverseEdge app = ServerUniverseEdge(
    onNotFound: (req, res) async {
      return res.status(404).json({"@type": "error", "message": "path_not_found", "description": "PATH: ${req.path} Not Found"});
    },
    onError: (req, res, object, stackTrace) {
      return res.status(500).json({"@type": "error", "message": "server_crash"});
    },
  );
  app.ensureInitialized();
  app.all("/", (req, res) {
    return res.send("oke");
  });
  app.all("/version", (req, res) {
    return res.json({
      "@type": "version",
      "version": "0.0.0",
    });
  });
}
"""
        .trim();
  }

  static String script_server_universe_functions_supabase({
    required String fileName,
  }) {
    return '''
import { serve } from "https://deno.land/std@0.131.0/http/server.ts";
import "./${fileName}";

serve((request) => {
  if (self.server_universeDartSupabaseFetchHandler) {
    return self.server_universeDartSupabaseFetchHandler(request);
  }

  return new Response("Something went wrong", { status: 500 });
});

declare global {
  interface Window {
    server_universeDartSupabaseFetchHandler?: (request: Request) => Promise<Response>;
  }
}
''';
  }

  static String guide_server_universe_markdown({required String name_project}) {
    return """
# Guide Server Universe

Server Universe Is created by [AZKADEV](https://github.com/azkadev) Sponsored By [Global Corporation]()

This guide for help you run this program

### Supabase

sudo supabase init

sudo supabase functions new ${name_project}

Run

dart run server_universe_dart run supabase
"""
        .trim();
  }
}
