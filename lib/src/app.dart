import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mars_rover_app/src/data/data_providers/rover_data_provider.dart';
import 'package:mars_rover_app/src/data/repositories/rover_data_repository.dart';
import 'package:mars_rover_app/src/presentation/home_screen/home.dart';
import 'package:mars_rover_app/src/presentation/splash_screen/splash.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Provider<RoverDataRepository>(
        create: (context) => RoverDataRepository(RoverDataProvider()),
        child: MaterialApp(
          builder: DevicePreview.appBuilder,
          title: 'MARS',
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/home': (context) => const HomeScreen()
          },
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
        ),
      );
}
