import 'theme.dart';
import 'generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/services/hive_services.dart';
import 'Core/utils/my_bloc_observer.dart';
import 'Core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Features/splash/presentation/views/pages/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.init();
  await HiveServices.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Daftarni دفترني',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale(
            ServiceLocator.getDataModel().preferences.languageCode,
          ),
          home: const SplashView(),
        );
      },
    );
  }
}
