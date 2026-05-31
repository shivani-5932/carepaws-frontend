import '../model/comment_model.dart';

class CommentController {

  List<CommentModel> comments = [];

  void addComment(CommentModel comment) {
    comments.insert(0, comment);
  }

  void deleteComment(int index) {
    comments.removeAt(index);
  }

}