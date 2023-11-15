import 'package:eden/util/route_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const Eden());
}

class Eden extends StatelessWidget {
  const Eden({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      routes: RouteHandler.routes,
      initialRoute: RouteHandler.initialRoute,
      onGenerateRoute: RouteHandler.generatedRoute,
    );
  }
}
