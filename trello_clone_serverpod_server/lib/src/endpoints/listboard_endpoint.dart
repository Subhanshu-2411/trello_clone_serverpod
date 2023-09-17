import 'package:serverpod/server.dart';
import 'package:trello_clone_serverpod_server/src/generated/board.dart';
import 'package:trello_clone_serverpod_server/src/generated/listboard.dart';

import '../generated/card.dart';

class ListboardEndpoint extends Endpoint {
  Future<List<Listboard>> getListsByBoard(Session session, {required int boardId}) async {
    List<Listboard> listboards = await Listboard.find(session, where: (l) => l.boardId.equals(boardId));
    for(int i = 0; i < listboards.length; i++) {
      List<Card> cards = await Card.find(session, where: (c) => c.listId.equals(listboards[i].id));
      listboards[i].cards = cards;
    }

    return listboards;
  }

  Future<Listboard> createList(Session session, Listboard listboard) async {
    await Listboard.insert(session, listboard);
    return listboard;
  }

}