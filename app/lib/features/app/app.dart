import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/features/app/observers/router_observer.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppInjector.instance.get<RootStackRouter>();

    return BlocProvider.value(
      value: AppInjector.instance.get<AppBloc>(),
      child: TranslationProvider(
        child: Builder(
          builder: (context) => MaterialApp.router(
            onGenerateTitle: (context) => context.l10n.common.appName,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            routerConfig: appRouter.config(
              navigatorObservers: () => [
                AppRouterObserver(),
              ],
            ),
            locale: TranslationProvider.of(context).flutterLocale,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: AppLocaleUtils.supportedLocales,
          ),
        ),
      ),
    );
  }
}
