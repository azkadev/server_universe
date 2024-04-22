# Server Universe
 
**Server Universe** is library for speed up and help you to make server rest api / forwarding / proxy very simple with highly customizable feature in cross platform (Server Side / Client Side) and Severless functions like (Supabase Functions, Vercel, Netlify, Cloud Flare)

## Demo


## ℹ️ Information / Help / Need Update?

This library created by poor programmers, i need more sponsor for make this library more easy, feature, documents, tutorial or speed up development this library, example so i need your support,

**Please Sponsor me** [AZKADEV](https://github.com/sponsors/azkadev) on github

**i need minimal** 50 **Dollar** / **month** 

## 📚️ Docs

1. [Documentation](/docs/)
2. [Youtube](https://youtube.com/@azkadev)
3. [Telegram Support Group](https://t.me/)
4. [Contact Developer](https://github.com/azkadev) (check social media or readme profile github)

## 🔖️ Features

1. [x] 📱️ **Cross Platform** support (Device, Edge Severless functions)
2. [x] 📜️ **Standarization** Style Code
3. [x] ⌨️ **Cli** (Terminal for help you use this library or create project)
4. [x] 🔥️ **Api** (If you developer bot / userbot you can use this library without interact cli just add library and use 🚀️)
5. [ ] 🧩️ **Customizable Extension** (if you want add extension so you can more speed up on development)
6. [ ] ✨️ **Pretty Information** (user friendly for newbie)
 
## ❔️ Fun Fact

**This library 100%** use on every my create project (**App, Server, Bot, Userbot**)
 
## 📈️ Proggres
 
- **2024-04-20**
  Starting **Release Stable** With core Features
- **2024-04-19**
  Starting create simple library **Server Universe**
- **2024-04-18**
  Think to standarization server so i can create project easy, and not only project i can add feature to my ai so my ai can create server and test direct without use rest-api, talk, searching internet or use any api 

### 📥️ Install Library

1. **Dart**

```bash
dart pub add server_universe_dart
```

2. **Flutter**

```bash
flutter pub add server_universe_flutter
```

### 💻️ Install Cli

- from pub

```bash

```

- from github

## 🚀️ Quick Start

Example Quickstart script minimal for insight you or make you use this library because very simple 

### Api

### Cli

### Edge

if you want deploy server rest api on Severless functions Like (Supabase, Cloud Flare, Deno Deploy, Vercel, Netlify)

```dart
import 'package:server_universe_dart/edge/edge.dart';
void main() async {
  print("start");
  ServerUniverseEdge app = ServerUniverseEdge(
    onNotFound: (request, res) async {
      return res.status(404).json({"@type": "error", "message": "path_not_found", "description": "PATH: ${request.path} Not Found"});
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
```


### Native

if you want deploy on device or server or vps, or flutter app try this script

```dart
import 'dart:io';
import 'package:server_universe_dart/native/native.dart';

void main() async {
  print("start");
  int port = int.tryParse(Platform.environment["PORT"] ?? "3000") ?? 3000;
  String host = Platform.environment["HOST"] ?? "0.0.0.0";
  ServerUniverseNative app = ServerUniverseNative(
    onNotFound: (request, res) async {
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
```