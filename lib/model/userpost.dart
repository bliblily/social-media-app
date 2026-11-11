
import 'usercomment.dart';

class Userpost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  final String numcomments;
  final String numshares;
  bool isLiked;

  List<Usercomment> comments;

  Userpost({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numcomments,
    required this.numshares,
    this.isLiked = false,
    List<Usercomment>? comments,
  }) : comments = comments ?? [];
}
