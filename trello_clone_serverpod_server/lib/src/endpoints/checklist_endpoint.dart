import 'package:serverpod/server.dart';
import 'package:trello_clone_serverpod_server/src/generated/protocol.dart';

class ChecklistEndpoint extends Endpoint {
  Future<Checklist> createChecklist(Session session, Checklist checklist) async {
    await Checklist.insert(session, checklist);
    return checklist;
  }

  Future<bool> updateChecklist(Session session, Checklist checklist) async {
    return await session.db.update(checklist);
  }

  Future<bool> deleteChecklist(Session session, Checklist checklist) async {
    return await Checklist.deleteRow(session, checklist);
  }

}