import 'package:analytics_service/analytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  group('AnalyticsService', () {
    late FirebaseAnalytics firebaseAnalytics;
    late AnalyticsService analyticsService;

    setUp(() {
      firebaseAnalytics = MockFirebaseAnalytics();
      analyticsService = AnalyticsService(firebaseAnalytics);

      when(
        () => firebaseAnalytics.logEvent(
          name: any(named: 'name'),
          parameters: any(named: 'parameters'),
        ),
      ).thenAnswer((_) async {});

      when(
        () => firebaseAnalytics.setUserId(id: any(named: 'id')),
      ).thenAnswer((_) async {});
    });

    test('creates FirebaseAnalytics instance internally when not injected', () {
      expect(() => analyticsService, isNot(throwsException));
    });

    group('track', () {
      test('tracks event successfully', () {
        const event = AnalyticsEvent(
          'TestEvent',
          parameters: {'test-key': 'mock-id'},
        );

        analyticsService.logEvent(event);

        verify(
          () => firebaseAnalytics.logEvent(
            name: event.name,
            parameters: event.parameters,
          ),
        ).called(1);
      });

      test(
          'throws TrackEventFailure '
          'when logEvent throws exception', () async {
        when(
          () => firebaseAnalytics.logEvent(
            name: any(named: 'name'),
            parameters: any(named: 'parameters'),
          ),
        ).thenThrow(Exception());

        const event = AnalyticsEvent(
          'event1',
          parameters: <String, dynamic>{
            'property1': 'value1',
            'property2': 'value2',
          },
        );

        expect(
          () => analyticsService.logEvent(event),
          throwsA(isA<LogEventException>()),
        );
      });
    });

    group('setUserId', () {
      test('sets user identifier successfully', () {
        const userId = 'userId';

        analyticsService.setUserId(userId);

        verify(
          () => firebaseAnalytics.setUserId(id: userId),
        ).called(1);
      });

      test(
          'throws SetUserIdFailure '
          'when setUserId throws exception', () async {
        when(
          () => firebaseAnalytics.setUserId(id: any(named: 'id')),
        ).thenThrow(Exception());

        expect(
          () => analyticsService.setUserId('userId'),
          throwsA(isA<SetUserIdException>()),
        );
      });
    });
  });
}
