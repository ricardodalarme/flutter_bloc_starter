import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:user_repository/user_repository.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    await pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthenticationRepository(),
          ),
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
        ],
        child: TranslationProvider(
          child: Builder(
            builder: (context) => MaterialApp(
              home: widget,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
