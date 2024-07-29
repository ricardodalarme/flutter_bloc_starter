import 'package:analytics_service/src/exceptions.dart';
import 'package:analytics_service/src/models/analytics_event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

abstract class AnalyticsService {
  Future<void> logEvent(AnalyticsEvent event);

  Future<void> setUserId(String? userId);
}

class AnalyticsServiceImpl implements AnalyticsService {
  factory AnalyticsServiceImpl([FirebaseAnalytics? firebaseAnalytics]) {
    return AnalyticsServiceImpl._(
      firebaseAnalytics ?? FirebaseAnalytics.instance,
    );
  }

  const AnalyticsServiceImpl._(this._firebaseAnalytics);

  final FirebaseAnalytics _firebaseAnalytics;

  @override
  Future<void> logEvent(AnalyticsEvent event) async {
    try {
      await _firebaseAnalytics.logEvent(
        name: event.name,
        parameters: event.parameters,
      );
    } catch (e) {
      throw LogEventException();
    }
  }

  @override
  Future<void> setUserId(String? userId) async {
    try {
      await _firebaseAnalytics.setUserId(id: userId);
    } catch (e) {
      throw SetUserIdException();
    }
  }
}
