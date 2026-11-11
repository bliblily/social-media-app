
import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/profileview.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';
import '../model/usercomment.dart';

class Postlist extends StatefulWidget {
  Postlist({super.key, required this.userdata});

  final Userdata userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  var nametxtStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  Map<Userpost, TextEditingController> commentControllers = {};

  TextEditingController getController(Userpost userPost) {
    if (!commentControllers.containsKey(userPost)) {
      commentControllers[userPost] = TextEditingController();
    }

    return commentControllers[userPost]!;
  }

  gotoPage(BuildContext context, dynamic page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Add comment
  void addComment(Userpost userPost) {
    var controller = getController(userPost);

    if (controller.text.trim().isEmpty) {
      return;
    }

    setState(() {
      userPost.comments.add(
        Usercomment(
          commenterImg: widget.userdata.myUserAccount.img,
          commenterName: widget.userdata.myUserAccount.name,
          commentTime: 'Just now',
          commentContent: controller.text.trim(),
        ),
      );

      controller.clear();
    });
  }

  Widget buttons(Userpost userPost) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor:
                  userPost.isLiked ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                userPost.isLiked = !userPost.isLiked;
              });
            },
            icon: const Icon(Icons.thumb_up),
            label: const Text('Like'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            onPressed: () {},
            icon: const Icon(Icons.message),
            label: const Text('Comment'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            onPressed: () {},
            icon: const Icon(Icons.share),
            label: const Text('Share'),
          ),
        ],
      );

  // Original comment and share counts
  Widget postCount(Userpost userPost) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('${userPost.numcomments} Comments'),
          const Text(' · '),
          const SizedBox(width: 20),
          Text('${userPost.numshares} Shares'),
        ],
      );

  Widget postImage(Userpost userPost) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPost.postimg),
              fit: BoxFit.fill,
            ),
          ),
        ),
      );

  Widget postHeader(Userpost userPost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(userPost.userimg),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userPost.username, style: nametxtStyle),
              Row(
                children: [
                  Text('${userPost.time} · '),
                  const Icon(Icons.people, size: 18),
                ],
              ),
            ],
          ),
        ],
      );

  // Display comments and comment input
  Widget commentSection(Userpost userPost) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display submitted comments
          ...userPost.comments.map((comment) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage(comment.commenterImg),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment.commenterName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(comment.commentContent),
                        Text(
                          comment.commentTime,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),

          // Comment input
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(
                    widget.userdata.myUserAccount.img,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: getController(userPost),
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                    ),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (value) {
                      addComment(userPost);
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    addComment(userPost);
                  },
                ),
              ],
            ),
          ),
        ],
      );

  // Post content with navigation
  Widget showPost(Userpost userPost) => Column(
        children: [
          InkWell(
            onTap: () {
              gotoPage(
                context,
                ProfileView(userPost: userPost),
              );
            },
            child: Column(
              children: [
                postHeader(userPost),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(userPost.postcontent, style: nametxtStyle),
                    ],
                  ),
                ),
                postImage(userPost),
                postCount(userPost),
                const Divider(),
                buttons(userPost),
              ],
            ),
          ),

          // Comments outside InkWell
          commentSection(userPost),

          SizedBox(
            height: 10,
            child: Container(color: Colors.grey),
          ),
          const SizedBox(height: 15),
        ],
      );

  @override
  void dispose() {
    for (var controller in commentControllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.userdata.userList.map((userPost) {
        return showPost(userPost);
      }).toList(),
    );
  }
}
