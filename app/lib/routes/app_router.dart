import 'package:auto_route/auto_route.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/change_password_page.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/presentation/edit_profile_page.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/presentation/forgot_password_page.dart';
import 'package:quickstart_flutter_bloc/features/home/presentation/home_page.dart';
import 'package:quickstart_flutter_bloc/features/login/presentation/login_page.dart';
import 'package:quickstart_flutter_bloc/features/not_found/not_found_page.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/post_page.dart';
import 'package:quickstart_flutter_bloc/features/privacy_policy/privacy_policy_page.dart';
import 'package:quickstart_flutter_bloc/features/profile/profile_page.dart';
import 'package:quickstart_flutter_bloc/features/search/search_page.dart';
import 'package:quickstart_flutter_bloc/features/settings/settings_page.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/signup_page.dart';
import 'package:quickstart_flutter_bloc/features/terms/presentation/terms_page.dart';

part 'app_router.gr.dart';

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
        AutoRoute(page: TermsRoute.page),
        AutoRoute(path: '*', page: NotFoundRoute.page),
      ];
}
