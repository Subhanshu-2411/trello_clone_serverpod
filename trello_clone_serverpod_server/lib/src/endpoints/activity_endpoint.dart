import 'package:serverpod/server.dart';
import 'package:trello_clone_serverpod_server/src/generated/activity.dart';

class ActivityEndpoint extends Endpoint {
  Future<bool> createActivity(Session session, Activity activity) async {
    await Activity.insert(session, activity);
    return true;
  }
}