import 'dart:async';
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:artemis/core/config/router.dart';
import "package:hive_flutter/hive_flutter.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:artemis/core/config/theme.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();

  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();

  static void setLocale(BuildContext context, String countryCode) {
    Hive.openBox("app").then((_) => _.put("language", countryCode));
    context.findAncestorStateOfType<_AppState>()!.setLocale(
          Locale(countryCode),
        );
  }
}

class _AppState extends ConsumerState<App> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();

    Hive.openBox("app").then((_) {
      switch (_.get("language")) {
        case "id":
          setState(() => _locale = const Locale("id"));
          break;

        default:
          setState(() => _locale = const Locale("en"));
          break;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  setLocale(Locale locale) => setState(() => _locale = locale);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRoutes.routers.routeInformationParser,
      routeInformationProvider: AppRoutes.routers.routeInformationProvider,
      routerDelegate: AppRoutes.routers.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: getThemeData(),
    );
  }
}
