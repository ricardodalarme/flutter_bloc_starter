import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/features/app/observers/router_observer.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AppInjector.instance.get<AppBloc>(),
      child: TranslationProvider(
        child: Builder(
          builder: (context) => MaterialApp.router(
            onGenerateTitle: (context) => context.l10n.common.appName,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            routerConfig: _appRouter.config(
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
