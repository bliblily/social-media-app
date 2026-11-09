import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';
import 'account.dart';

class Userdata {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/images/user1.jpg',
      username: 'John Doe',
      time: '2 hours ago',
      postcontent: 'This is a sample post content.',
      postimg: 'assets/images/post1.jpg',
      numcomments: '5',
      numshares: '2',
      isLiked: false,
    ),

    Userpost(
      userimg: 'assets/images/user2.jpg',
      username: 'Jane Smith',
      time: '3 hours ago',
      postcontent: 'Another sample post content.',
      postimg: 'assets/images/post2.jpg',
      numcomments: '10',
      numshares: '4',
      isLiked: true,
    ),
    
    Userpost(
      userimg: 'assets/images/user3.jpg',
      username: 'Alice Johnson',
      time: '5 hours ago',
      postcontent: 'Yet another sample post content.',
      postimg: 'assets/images/post3.jpg',
      numcomments: '8',
      numshares: '3',
      isLiked: false,
    ),

    Userpost(
      userimg: 'assets/images/user4.jpg',
      username: 'Bob Brown',
      time: '1 day ago',
      postcontent: 'This is a sample post content.',
      postimg: 'assets/images/post4.jpg',
      numcomments: '12',
      numshares: '6',
      isLiked: true,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/images/user1.jpg', name: 'John Doe'),
    Friend(img: 'assets/images/user2.jpg', name: 'Jane Smith'), 
    Friend(img: 'assets/images/user3.jpg', name: 'Alice Johnson'),
    Friend(img: 'assets/images/user4.jpg', name: 'Bob Brown'),  
    Friend(img: 'assets/images/user5.jpg', name: 'Charlie Davis'),
    Friend(img: 'assets/images/user6.jpg', name: 'Emily Wilson'),
  ];

  List<Usercomment> commentList = [
    Usercomment(commenterImg: 'assets/images/user1.jpg',
                commenterName: 'Jane Smith',
                commentTime: '2 hours ago',
                commentContent: 'wow beautiful!'),

    Usercomment(commenterImg: 'assets/images/user2.jpg', 
                commenterName: 'Kenneth Vladimir', 
                commentTime: '5 hrs ago', 
                commentContent: 'amazing post!'),

    Usercomment(commenterImg: 'assets/images/user1.jpg',
                commenterName: 'Miko Rojo',
                commentTime: '2 hours ago',
                commentContent: 'that is so cool!'),  
  ];

  Account myUserAccount = Account(
    name: 'Gwendolyn Lianna Peralta', 
    email: 'gwenperalta@gmail.com',
    img: 'assets/images/user1.jpg',
    numFollowers: '120',
    numPosts: '35', 
    numFollowing: '80',
    numfriends: '50');
}