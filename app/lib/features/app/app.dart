import 'package:authentication_repository/authentication_repository.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        authenticationRepository:
            AppInjector.instance.get<AuthenticationRepository>(),
      ),
      child: TranslationProvider(
        child: Builder(
          builder: (context) => MaterialApp.router(
            onGenerateTitle: (context) => context.l10n.common.appName,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            routerConfig: AppRoutes.router,
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
