import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/home/cubit/home_cubit.dart';
import 'package:quickstart_flutter_bloc/features/home/home_view.dart';

import '../test_helpers/pump_app.dart';

class MockHomeBloc extends MockCubit<int> implements HomeCubit {}

void main() {
  group('HomeView', () {
    late HomeCubit homeCubit;

    setUp(() {
      homeCubit = MockHomeBloc();
      when(() => homeCubit.state).thenReturn(0);
    });

    testWidgets('renders view', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: homeCubit,
          child: const HomeView(),
        ),
      );

      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
