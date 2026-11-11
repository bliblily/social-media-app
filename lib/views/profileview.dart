
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/usercomment.dart';
import 'package:flutter_application_2/model/userdata.dart';
import 'package:flutter_application_2/model/userpost.dart';

class ProfileView extends StatefulWidget {
  ProfileView({super.key, required this.userPost});

  final Userpost userPost;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final Userdata userData = Userdata();

  final TextEditingController commentController =
      TextEditingController();

  var nameTxtStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  var boldTxtStyle =
      const TextStyle(fontWeight: FontWeight.bold);

  var boldTxtStyle1 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  // Add comment
  void addComment() {
    if (commentController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      widget.userPost.comments.add(
        Usercomment(
          commenterImg: userData.myUserAccount.img,
          commenterName: userData.myUserAccount.name,
          commentTime: 'Just now',
          commentContent: commentController.text.trim(),
        ),
      );

      commentController.clear();
    });
  }

  Widget commentBtn(Usercomment userComment) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(userComment.commentTime),
            const SizedBox(width: 15),
            const Text('Like'),
            const SizedBox(width: 15),
            const Text('Reply'),
          ],
        ),
      );

  Widget commentDesc(Usercomment userComment) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userComment.commenterName,
              style: boldTxtStyle,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(userComment.commentContent),
              ],
            ),
          ],
        ),
      );

  Widget commentSpace(Usercomment userComment) => Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: commentDesc(userComment),
      );

  Widget commenterPic(Usercomment userComment) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userComment.commenterImg),
        ),
      );

  Widget usercommenterline(
          Userpost userPost, Usercomment userComment) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          commenterPic(userComment),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commentSpace(userComment),
              commentBtn(userComment),
            ],
          ),
        ],
      );

  Widget userpostdetails(
          Userpost userPost, Usercomment userComment) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          usercommenterline(userPost, userComment),
        ],
      );

  Widget commenters(Userpost userPost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  userPost.numshares,
                  style: boldTxtStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text('All comments', style: boldTxtStyle),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      );

  Widget buttons(Userpost userPost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        userPost.isLiked ? Colors.grey : Colors.blue,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up, size: 20),
                  label: const Text('Like'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble, size: 20),
                  label: const Text('Comment'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.share, size: 20),
                  label: const Text('Share'),
                ),
              ],
            ),
          ),
        ],
      );

  Widget userline(Userpost userPost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(userPost.userimg),
              radius: 20,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userPost.username, style: nameTxtStyle),
              const SizedBox(height: 5.5),
              Row(
                children: [
                  Text(userPost.time),
                  const Text(' · '),
                  const Icon(
                    Icons.group,
                    size: 15,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  Widget postimage(Userpost userPost) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(userPost.postcontent),
              ],
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                userPost.postimg,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );

  // Comment TextField and Send button
  Widget commentInput() => Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(
                userData.myUserAccount.img,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: commentController,
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
                  addComment();
                },
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.blue,
              ),
              onPressed: addComment,
            ),
          ],
        ),
      );

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          userline(widget.userPost),
          postimage(widget.userPost),
          buttons(widget.userPost),
          commenters(widget.userPost),


          // Comment input below all comments
          commentInput(),
          
          // Original comments
          ...userData.commentList.map(
            (userComment) =>
                userpostdetails(widget.userPost, userComment),
          ),

          // Newly added comments
          ...widget.userPost.comments.map(
            (userComment) =>
                userpostdetails(widget.userPost, userComment),
          ),

          
        ],
      ),
    );
  }
}
