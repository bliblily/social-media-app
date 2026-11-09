import 'package:flutter/material.dart';
import 'package:flutter_application_1/SocialMediaApp/model/usercomment.dart';
import 'package:flutter_application_1/SocialMediaApp/model/userdata.dart';
import 'package:flutter_application_1/SocialMediaApp/model/userpost.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key, required this.userPost});

  final Userpost userPost;
  final Userdata userData = Userdata();

  var nameTxtStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  var boldTxtStyle = const TextStyle(fontWeight: FontWeight.bold);

  var boldTxtStyle1 = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  Widget commentBtn (Usercomment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(userComment.commentTime),
        const SizedBox(width: 15),
        Text('Like'),
        const SizedBox(width: 15),
        Text('Reply'),
      ],
    ),  
  );


  Widget commentDesc (Usercomment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal:10),  
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userComment.commenterName, style: boldTxtStyle,),
        const SizedBox(height: 5),
        Row(children: [Text(userComment.commentContent)]),
      ],
    )
  );

  Widget commentSpace (Usercomment userComment) => Container(
    decoration: const BoxDecoration(
      color : Colors.grey,
      borderRadius: BorderRadius.all( Radius.circular(20)),
    ),
    child: commentDesc(userComment),
  );
  
  
  Widget commenterPic (Usercomment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),  
    child: CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(userComment.commenterImg),
    )
  );

  Widget 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userdata.postList.length,
      itemBuilder: (BuildContext context, int index) {
        final post = userdata.postList[index];
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(post.userimg),
                ),
                title: Text(post.username),
                subtitle: Text(post.time),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(post.postcontent),
              ),
              if (post.postimg.isNotEmpty)
                Image.asset(post.postimg),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${post.numcomments} comments'),
                    Text('${post.numshares} shares'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
