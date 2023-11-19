import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/edit_profile_view.dart';

import '../test_helpers/pump_app.dart';

class MockEditProfileBloc extends MockBloc<EditProfileEvent, EditProfileState>
    implements EditProfileBloc {}

void main() {
  group('EditProfileView', () {
    late EditProfileBloc editProfileBloc;

    setUp(() {
      editProfileBloc = MockEditProfileBloc();
      when(() => editProfileBloc.state).thenReturn(const EditProfileState());
    });

    testWidgets('renders view', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: editProfileBloc,
          child: const EditProfileView(),
        ),
      );
      await tester.pump();

      expect(find.byType(EditProfileView), findsOneWidget);
    });
  });
}
