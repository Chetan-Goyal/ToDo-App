import 'package:flutter/material.dart';

import 'app.dart';
import 'config/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const App());
}
