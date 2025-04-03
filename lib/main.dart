import 'package:flutter/material.dart';

import 'app.dart';
import 'core/common/service/app_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerAppDependencies();
  runApp(const RickAndMortyApp());
}
