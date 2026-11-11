
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/friend.dart';
import '../model/userdata.dart';

class Friendlist extends StatelessWidget {
  Friendlist({super.key, required this.userdata});

  final Userdata userdata;

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friend friend) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            SizedBox(
              height: 130,
              width: double.infinity,
              child: Image.asset(
                friend.img,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: Center(
                child: Text(
                  friend.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );

  Widget friendListGrid() => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 180,
        ),
        itemCount: userdata.friendList.length,
        itemBuilder: (BuildContext ctx, index) {
          return friend(userdata.friendList[index]);
        },
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text('Friends', style: followTxtStyle),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 380,
          child: friendListGrid(),
        ),
        SizedBox(
          height: 10,
          child: Container(color: Colors.grey),
        ),
      ],
    );
  }
}
