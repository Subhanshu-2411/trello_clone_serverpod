import 'package:serverpod/server.dart';

import '../generated/card.dart';

class CardEndpoint extends Endpoint {
  Future<Card> createCard(Session session, Card card) async {
    await Card.insert(session, card);
    return card;
  }

  Future<bool> updateCard(Session session, Card card) async {
    return await session.db.update(card);
  }
}