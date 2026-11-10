import 'package:flutter_application_2/model/friend.dart';
import 'package:flutter_application_2/model/usercomment.dart';
import 'package:flutter_application_2/model/userpost.dart';
import 'package:flutter_application_2/model/account.dart';

class Userdata {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/male1.jpg',
      username: 'John Doe',
      time: '2 hours ago',
      postcontent: 'beach day',
      postimg: 'assets/post1.jpg',
      numcomments: '5',
      numshares: '2',
      isLiked: false,
    ),

    Userpost(
      userimg: 'assets/female1.jpg',
      username: 'Jane Smith',
      time: '3 hours ago',
      postcontent: 'fun rides',
      postimg: 'assets/post2.jpg',
      numcomments: '10',
      numshares: '4',
      isLiked: true,
    ),
    
    Userpost(
      userimg: 'assets/female2.jpg',
      username: 'Alice Johnson',
      time: '5 hours ago',
      postcontent: 'sushi night',
      postimg: 'assets/post3.jpg',
      numcomments: '8',
      numshares: '3',
      isLiked: false,
    ),

    Userpost(
      userimg: 'assets/male2.jpg',
      username: 'Bob Brown',
      time: '1 day ago',
      postcontent: 'rainy day',
      postimg: 'assets/post4.jpg',
      numcomments: '12',
      numshares: '6',
      isLiked: true,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/male1.jpg', name: 'John Doe'),
    Friend(img: 'assets/female1.jpg', name: 'Jane Smith'), 
    Friend(img: 'assets/female2.jpg', name: 'Alice Johnson'),
    Friend(img: 'assets/male2.jpg', name: 'Bob Brown'),  
    Friend(img: 'assets/male3.jpg', name: 'Charlie Davis'),
    Friend(img: 'assets/female3.jpg', name: 'Emily Wilson'),
  ];

  List<Usercomment> commentList = [
    Usercomment(commenterImg: 'assets/female1.jpg',
                commenterName: 'Jane Smith',
                commentTime: '2 hours ago',
                commentContent: 'wow beautiful!'),

    Usercomment(commenterImg: 'assets/male4.jpg', 
                commenterName: 'Kenneth Vladimir', 
                commentTime: '5 hrs ago', 
                commentContent: 'amazing post!'),

    Usercomment(commenterImg: 'assets/male5.jpg',
                commenterName: 'Miko Rojo',
                commentTime: '2 hours ago',
                commentContent: 'that is so cool!'),  
  ];

  Account myUserAccount = Account(
    name: 'Gwendolyn Lianna Peralta', 
    email: 'gwenperalta@gmail.com',
    img: 'assets/user.jpg',
    numFollowers: '120',
    numPosts: '35', 
    numFollowing: '80',
    numfriends: '50');
}