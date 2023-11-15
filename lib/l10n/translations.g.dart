/// Generated file. Do not edit.
///
/// Original: lib/l10n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 66 (33 per locale)
///
/// Built on 2023-11-15 at 17:06 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _TranslationsEn> {
  en(languageCode: 'en', build: _TranslationsEn.build),
  pt(languageCode: 'pt', build: _TranslationsPt.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, _TranslationsEn> build;

  /// Gets current instance managed by [LocaleSettings].
  _TranslationsEn get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of l10n).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = l10n.someKey.anotherKey;
/// String b = l10n['someKey.anotherKey']; // Only for edge cases!
_TranslationsEn get l10n => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final l10n = Translations.of(context); // Get l10n variable.
/// String a = l10n.someKey.anotherKey; // Use l10n variable.
/// String b = l10n['someKey.anotherKey']; // Only for edge cases!
class Translations {
  Translations._(); // no constructor

  static _TranslationsEn of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _TranslationsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, _TranslationsEn> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, _TranslationsEn> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _TranslationsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.l10n.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  _TranslationsEn get l10n => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, _TranslationsEn> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _TranslationsEn> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _TranslationsEn implements BaseTranslations<AppLocale, _TranslationsEn> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsEn.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final _TranslationsEn _root = this; // ignore: unused_field

  // Translations
  late final _TranslationsFeedEn feed = _TranslationsFeedEn._(_root);
  late final _TranslationsAppEn app = _TranslationsAppEn._(_root);
}

// Path: feed
class _TranslationsFeedEn {
  _TranslationsFeedEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Feed';
}

// Path: app
class _TranslationsAppEn {
  _TranslationsAppEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get appName => 'Flutter Bloc Starter';
  String get login => 'Login';
  String get email => 'Email';
  String get password => 'Password';
  String get logout => 'Logout';
  String get dontHaveAnAccount => 'Don\'t have an account? ';
  String get signUp => 'Sign Up';
  String get confirmPassword => 'Confirm Password';
  String get pageNotFound => 'Page not found';
  String get goBackHome => 'Go back home';
  String get error404 => '404';
  String get forgotPassword => 'Forgot Password?';
  String get recoverPassword => 'Recover Password';
  String get forgotPasswordDescription =>
      'Enter your email address and we\'ll send you a code to reset your password';
  String get send => 'Send';
  String get forgotPasswordPinDescription =>
      'Enter the code sent to your email address';
  String get resendCode => 'Resend Code';
  String get resetPassword => 'Reset Password';
  String get newPassword => 'New Password';
  String get changePassword => 'Change Password';
  String get currentPassword => 'Current Password';
  String get save => 'Save';
  String get or => 'Or';
  String signInWith({required Object provider}) => 'Sign in with ${provider}';
  String get profile => 'Profile';
  String get editProfile => 'Edit Profile';
  String get settings => 'Settings';
  String get firstName => 'First Name';
  String get lastName => 'Last Name';
  String get search => 'Search';
  String get privacyPolicy => 'Privacy Policy';
  String get termsOfUse => 'Terms of Use';
}

// Path: <root>
class _TranslationsPt extends _TranslationsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsPt.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.pt,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ),
        super.build(
            cardinalResolver: cardinalResolver,
            ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction(
        $meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <pt>.
  @override
  final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  @override
  late final _TranslationsPt _root = this; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsFeedPt feed = _TranslationsFeedPt._(_root);
  @override
  late final _TranslationsAppPt app = _TranslationsAppPt._(_root);
}

// Path: feed
class _TranslationsFeedPt extends _TranslationsFeedEn {
  _TranslationsFeedPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Feed';
}

// Path: app
class _TranslationsAppPt extends _TranslationsAppEn {
  _TranslationsAppPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get appName => 'Flutter Bloc Starter';
  @override
  String get login => 'Login';
  @override
  String get email => 'Email';
  @override
  String get password => 'Senha';
  @override
  String get logout => 'Sair';
  @override
  String get signUp => 'Registrar';
  @override
  String get dontHaveAnAccount => 'Não tem uma conta? ';
  @override
  String get confirmPassword => 'Confirmar Senha';
  @override
  String get pageNotFound => 'Página não encontrada';
  @override
  String get goBackHome => 'Voltar para página inicial';
  @override
  String get error404 => '404';
  @override
  String get forgotPassword => 'Esqueceu a senha?';
  @override
  String get recoverPassword => 'Recuperar Senha';
  @override
  String get forgotPasswordDescription =>
      'Digite seu email e enviaremos um código para redefinir sua senha.';
  @override
  String get send => 'Enviar';
  @override
  String get forgotPasswordPinDescription =>
      'Digite o código que enviamos para seu email.';
  @override
  String get resendCode => 'Reenviar código';
  @override
  String get resetPassword => 'Redefinir Senha';
  @override
  String get newPassword => 'Nova Senha';
  @override
  String get changePassword => 'Alterar Senha';
  @override
  String get currentPassword => 'Senha Atual';
  @override
  String get save => 'Salvar';
  @override
  String get or => 'Ou';
  @override
  String signInWith({required Object provider}) => 'Continue com ${provider}';
  @override
  String get profile => 'Perfil';
  @override
  String get editProfile => 'Editar Perfil';
  @override
  String get settings => 'Configurações';
  @override
  String get firstName => 'Nome';
  @override
  String get lastName => 'Sobrenome';
  @override
  String get search => 'Pesquisar';
  @override
  String get privacyPolicy => 'Política de Privacidade';
  @override
  String get termsOfUse => 'Termos de Uso';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEn {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'feed.title':
        return 'Feed';
      case 'app.appName':
        return 'Flutter Bloc Starter';
      case 'app.login':
        return 'Login';
      case 'app.email':
        return 'Email';
      case 'app.password':
        return 'Password';
      case 'app.logout':
        return 'Logout';
      case 'app.dontHaveAnAccount':
        return 'Don\'t have an account? ';
      case 'app.signUp':
        return 'Sign Up';
      case 'app.confirmPassword':
        return 'Confirm Password';
      case 'app.pageNotFound':
        return 'Page not found';
      case 'app.goBackHome':
        return 'Go back home';
      case 'app.error404':
        return '404';
      case 'app.forgotPassword':
        return 'Forgot Password?';
      case 'app.recoverPassword':
        return 'Recover Password';
      case 'app.forgotPasswordDescription':
        return 'Enter your email address and we\'ll send you a code to reset your password';
      case 'app.send':
        return 'Send';
      case 'app.forgotPasswordPinDescription':
        return 'Enter the code sent to your email address';
      case 'app.resendCode':
        return 'Resend Code';
      case 'app.resetPassword':
        return 'Reset Password';
      case 'app.newPassword':
        return 'New Password';
      case 'app.changePassword':
        return 'Change Password';
      case 'app.currentPassword':
        return 'Current Password';
      case 'app.save':
        return 'Save';
      case 'app.or':
        return 'Or';
      case 'app.signInWith':
        return ({required Object provider}) => 'Sign in with ${provider}';
      case 'app.profile':
        return 'Profile';
      case 'app.editProfile':
        return 'Edit Profile';
      case 'app.settings':
        return 'Settings';
      case 'app.firstName':
        return 'First Name';
      case 'app.lastName':
        return 'Last Name';
      case 'app.search':
        return 'Search';
      case 'app.privacyPolicy':
        return 'Privacy Policy';
      case 'app.termsOfUse':
        return 'Terms of Use';
      default:
        return null;
    }
  }
}

extension on _TranslationsPt {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'feed.title':
        return 'Feed';
      case 'app.appName':
        return 'Flutter Bloc Starter';
      case 'app.login':
        return 'Login';
      case 'app.email':
        return 'Email';
      case 'app.password':
        return 'Senha';
      case 'app.logout':
        return 'Sair';
      case 'app.signUp':
        return 'Registrar';
      case 'app.dontHaveAnAccount':
        return 'Não tem uma conta? ';
      case 'app.confirmPassword':
        return 'Confirmar Senha';
      case 'app.pageNotFound':
        return 'Página não encontrada';
      case 'app.goBackHome':
        return 'Voltar para página inicial';
      case 'app.error404':
        return '404';
      case 'app.forgotPassword':
        return 'Esqueceu a senha?';
      case 'app.recoverPassword':
        return 'Recuperar Senha';
      case 'app.forgotPasswordDescription':
        return 'Digite seu email e enviaremos um código para redefinir sua senha.';
      case 'app.send':
        return 'Enviar';
      case 'app.forgotPasswordPinDescription':
        return 'Digite o código que enviamos para seu email.';
      case 'app.resendCode':
        return 'Reenviar código';
      case 'app.resetPassword':
        return 'Redefinir Senha';
      case 'app.newPassword':
        return 'Nova Senha';
      case 'app.changePassword':
        return 'Alterar Senha';
      case 'app.currentPassword':
        return 'Senha Atual';
      case 'app.save':
        return 'Salvar';
      case 'app.or':
        return 'Ou';
      case 'app.signInWith':
        return ({required Object provider}) => 'Continue com ${provider}';
      case 'app.profile':
        return 'Perfil';
      case 'app.editProfile':
        return 'Editar Perfil';
      case 'app.settings':
        return 'Configurações';
      case 'app.firstName':
        return 'Nome';
      case 'app.lastName':
        return 'Sobrenome';
      case 'app.search':
        return 'Pesquisar';
      case 'app.privacyPolicy':
        return 'Política de Privacidade';
      case 'app.termsOfUse':
        return 'Termos de Uso';
      default:
        return null;
    }
  }
}
