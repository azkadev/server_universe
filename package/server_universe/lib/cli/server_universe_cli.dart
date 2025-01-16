// ignore_for_file: unused_local_variable, non_constant_identifier_names

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

import 'package:general_lib/extension/extension.dart';
import 'package:general_lib/fork/mason_logger/mason_logger.dart';
import 'package:server_universe/api/server_universe_api_core.dart';
import 'package:general_lib/args/args.dart';

/// ServerUniverseUncompleteDocumentation
Logger logger = Logger();

/// ServerUniverseUncompleteDocumentation
Future<void> server_universeDartCli(List<String> args_raw) async {
  ServerUniverseApi serverUniverseApi = ServerUniverseApi();
  Args args = Args(args_raw);

  bool is_interactive = true;
  if (Platform.environment["no_interactive"] == "true") {
    is_interactive = false;
  }

  String command = (args.arguments.firstOrNull ?? "").toLowerCase();
  List<String> commands = [
    "build",
    "create",
    "init",
    "deploy",
    "run",
  ];
  commands.sort();
  if (commands.contains(command) == false) {
    if (is_interactive) {
      command = logger.chooseOne(
        "Pilih",
        choices: commands,
        display: (choice) {
          return choice.toUpperCaseFirstData();
        },
      );
    } else {
      print("Please use command: ${commands.join("\n")}");
      exit(1);
    }
  }

  ServerUniverseBuildType server_universeDartBuildType =
      ServerUniverseBuildType.release;

  if (args.contains("--debug")) {
    server_universeDartBuildType = ServerUniverseBuildType.debug;
  }

  if (args.contains("-d")) {
    server_universeDartBuildType = ServerUniverseBuildType.debug;
  }

  if (command == "create") {
    Directory directory_current = Directory.current;
    String new_project_name = await Future(() async {
      String new_project_name_from_command =
          (args.after(command) ?? "").toLowerCase();
      if (new_project_name_from_command.isNotEmpty) {
        return new_project_name_from_command;
      }
      if (is_interactive) {
        while (true) {
          await Future.delayed(Duration(microseconds: 1));
          String server_universeDartPlatformType = logger.prompt(
            "Name New Project: ",
          );

          if (server_universeDartPlatformType.isNotEmpty) {
            return server_universeDartPlatformType;
          }
        }
      }
      return "";
    });
    if (new_project_name.isEmpty) {
      print("Failed");
      exit(1);
    }
    await serverUniverseApi
        .create(newName: new_project_name, directoryBase: directory_current)
        .listen((event) {
      printed(event);
    }).asFuture();
    exit(0);
  }
  if (["run", "build"].contains(command)) {
    ServerUniversePlatformType? server_universeDartPlatformType =
        await Future(() async {
      String platform_type = (args.after(command) ?? "").toLowerCase();
      List<ServerUniversePlatformType> server_universeDartPlatformTypes =
          ServerUniversePlatformType.values.toList();
      server_universeDartPlatformTypes.sort((a, b) => a.name.compareTo(b.name));
      for (ServerUniversePlatformType server_universeDartPlatformType
          in server_universeDartPlatformTypes) {
        if (server_universeDartPlatformType.name.toLowerCase() ==
            platform_type) {
          return server_universeDartPlatformType;
        }
      }
      if (is_interactive) {
        while (true) {
          await Future.delayed(Duration(microseconds: 1));
          ServerUniversePlatformType server_universeDartPlatformType =
              logger.chooseOne(
            "Pilih Platform: ",
            choices: server_universeDartPlatformTypes,
            display: (choice) {
              return choice.name.toLowerCase();
            },
          );

          return server_universeDartPlatformType;
        }
      }
      // ignore: dead_code
      return null;
    });
    if (server_universeDartPlatformType == null) {
      print(
          "Please select platform type: ${ServerUniversePlatformType.values.map((e) => e.name).join(", ")}");
      exit(1);
    }
    Directory directory_current = Directory.current;

    if ([
      "build",
      "run",
      "deploy",
    ].contains(command)) {
      String? inputFileName = () {
        String input = (args.after("-i") ?? args.after("--input") ?? "").trim();
        if (input.isNotEmpty) {
          return input;
        }
        return null;
      }();
      Directory? directoryOutputBuildServerUniverse = () {
        String output =
            (args.after("-o") ?? args.after("--output") ?? "").trim();
        if (output.isNotEmpty) {
          return Directory(output);
        }
        return null;
      }();

      await serverUniverseApi
          .build(
              directoryBase: directory_current,
              inputFileName: inputFileName,
              directoryOutputBuildServerUniverse:
                  directoryOutputBuildServerUniverse,
              server_universeDartBuildType: server_universeDartBuildType,
              server_universeDartPlatformType: server_universeDartPlatformType)
          .listen((event) {
        printed(event);
      }).asFuture();
      if (command == "build") {
        print("Finished");
        exit(0);
      }
      if (command == "run") {
        logger
            .info("Starting running: ${server_universeDartPlatformType.name}");

        int exit_code = await serverUniverseApi.run(
          directoryBase: directory_current,
          inputFileName: inputFileName,
          directoryOutputBuildServerUniverse:
              directoryOutputBuildServerUniverse,
          server_universeDartBuildType: server_universeDartBuildType,
          server_universeDartPlatformType: server_universeDartPlatformType,
          onBuild: (serverUniverseApiStatus) {
            printed(serverUniverseApiStatus);
          },
        );
        exit(exit_code);
      }
    }
  }
  exit(1);
}

/// ServerUniverseUncompleteDocumentation
Progress progress = logger.progress("message");

/// ServerUniverseUncompleteDocumentation
void printed(ServerUniverseApiStatus event) {
  if (event.serverUniverseApiStatusType ==
      ServerUniverseApiStatusType.progress_start) {
    progress.cancel();
    progress = logger.progress(event.value);
    return;
  }
  if (event.serverUniverseApiStatusType ==
      ServerUniverseApiStatusType.progress) {
    progress.update(event.value);
    return;
  }
  if (event.serverUniverseApiStatusType ==
      ServerUniverseApiStatusType.progress_complete) {
    progress.complete(event.value);

    // progress.cancel();
    return;
  }
  if (event.serverUniverseApiStatusType == ServerUniverseApiStatusType.succes) {
    logger.success(event.value);
    return;
  }
  if (event.serverUniverseApiStatusType == ServerUniverseApiStatusType.failed) {
    logger.err(event.value);
    return;
  }

  logger.info(event.value);
}
