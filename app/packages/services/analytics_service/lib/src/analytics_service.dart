import 'package:analytics_service/src/exceptions.dart';
import 'package:analytics_service/src/models/analytics_event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  const AnalyticsService(this._analyticsService);

  final FirebaseAnalytics _analyticsService;

  Future<void> logEvent(AnalyticsEvent event) async {
    try {
      await _analyticsService.logEvent(
        name: event.name,
        parameters: event.parameters,
      );
    } catch (e) {
      throw LogEventException();
    }
  }

  Future<void> setUserId(String? userId) async {
    try {
      await _analyticsService.setUserId(id: userId);
    } catch (e) {
      throw SetUserIdException();
    }
  }
}
