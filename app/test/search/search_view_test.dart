import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/login/bloc/login_bloc.dart';
import 'package:quickstart_flutter_bloc/features/search/search_view.dart';

import '../test_helpers/pump_app.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  group('SearchView', () {
    late LoginBloc loginBloc;

    setUp(() {
      loginBloc = MockLoginBloc();
      when(() => loginBloc.state).thenReturn(const LoginState());
    });

    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const SearchView());
      await tester.pump();

      expect(find.byType(SearchView), findsOneWidget);
    });
  });
}
