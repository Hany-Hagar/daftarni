import 'theme.dart';
import 'generated/l10n.dart';
import 'package:flutter/material.dart';
import 'core/services/hive_services.dart';
import 'core/utils/my_bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/settings/data/repo/settings_repo_impl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/splash/presentation/views/pages/splash_view.dart';
import 'features/settings/presentation/manager/settings_cubit.dart';
import 'features/settings/presentation/manager/settings_states.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create:
              (context) => SettingsCubit(
                settingsRepo: SettingsRepoImpl(
                  hiveServices: ServiceLocator.getHiveServices(),
                ),
              ),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsStates>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                title: 'Daftarni دفترني',
                themeMode: SettingsCubit.get(context).setThemeMode(),
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
        },
      ),
    );
  }
}
