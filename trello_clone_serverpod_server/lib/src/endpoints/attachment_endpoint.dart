import 'package:serverpod/server.dart';
import 'package:trello_clone_serverpod_server/src/generated/activity.dart';

class AttachmentEndpoint extends Endpoint {
  Future<bool> addAttachment(Session session, Activity activity) async {
    await Activity.insert(session, activity);
    return true;
  }
}