import 'package:serverpod/server.dart';

import '../generated/protocol.dart';

class CommentEndpoint extends Endpoint {
  Future<Comment> createComment(Session session, Comment comment) async {
    await Comment.insert(session, comment);
    return comment;
  }

  Future<bool> deleteComment(Session session, Comment comment) async {
    return await Comment.deleteRow(session, comment);
  }

}