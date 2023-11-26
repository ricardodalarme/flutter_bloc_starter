import 'package:auto_route/auto_route.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/change_password_view.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/presentation/edit_profile_view.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/presentation/forgot_password_view.dart';
import 'package:quickstart_flutter_bloc/features/home/home_view.dart';
import 'package:quickstart_flutter_bloc/features/login/presentation/login_view.dart';
import 'package:quickstart_flutter_bloc/features/not_found/not_found_view.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/post_view.dart';
import 'package:quickstart_flutter_bloc/features/privacy_policy/privacy_policy_view.dart';
import 'package:quickstart_flutter_bloc/features/profile/profile_view.dart';
import 'package:quickstart_flutter_bloc/features/search/search_view.dart';
import 'package:quickstart_flutter_bloc/features/settings/settings_view.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/signup_view.dart';
import 'package:quickstart_flutter_bloc/features/terms_of_use/terms_of_use_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(page: PostRoute.page, initial: true),
            AutoRoute(page: SearchRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsOfUseRoute.page),
        AutoRoute(path: '*', page: NotFoundRoute.page),
      ];
}
