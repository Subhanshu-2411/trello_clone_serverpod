import 'package:serverpod/server.dart';
import 'package:trello_clone_serverpod_server/src/generated/protocol.dart';

import '../generated/board.dart';

class BoardEndpoint extends Endpoint {

  Future<Board> createBoard(Session session, Board board) async {
    await Board.insert(session, board);
    return board;
  }

  Future<bool> updateBoard(Session session, Board board) async {
    return await session.db.update(board);
  }

  Future<bool> deleteBoard(Session session, Board board) async {
    return await Board.deleteRow(session, board);
  }

  Future<Workspace?> getWorkspaceForBoard(Session session, Board board) async {
    Workspace? workspace = await Workspace.findSingleRow(session, where: (w) => w.id.equals(board.workspaceId));
    return workspace;
  }

}