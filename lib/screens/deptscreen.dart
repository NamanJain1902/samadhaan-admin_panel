import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samadhan/data/constants.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
String email;

class ChatScreen1 extends StatefulWidget {
  @override
  _ChatScreenState1 createState() => _ChatScreenState1();
}

class _ChatScreenState1 extends State<ChatScreen1> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        email = loggedInUser.email;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                'Complaints',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              MessagesStream(),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('complaints').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final department = message.data['department'];
          final details = message.data['details'];
          final colony = message.data['colony'];
          final consumerId = message.data['consumerId'];
          final house = message.data['house no'];
          final name = message.data['name'];
          final phone = message.data['phone'];
          final status = message.data['status'];
          final date = message.data['date'];
          final ward = message.data['ward no'];
          final village = message.data['village'];
          final complaintId = message.data['trackingId'];
          final remarks = message.data['remarks'];
          String address;
          if (ward == null) {
            address = '$house,$colony,$village';
          } else {
            address = '$house,$colony, Ward Number:$ward';
          }
          final currentUser = loggedInUser.email;
          print('$currentUser');
          final messageBubble = MessageBubble(
            name: name,
            phone: phone,
            complaintId: complaintId.toString(),
            status: status,
            date: date,
            department: department,
            address: address,
            complaint: details,
          );
//          "None",
//        "Animal Husbandry",
//        "BDPO",
//        "Civil Hospital",
//        "DHBVN(Urban)",
//        "DHBVN(Rural)",
//        "Distt. Town planner ",
//        "Education(Elementary)",
//        "Education(Higher)",
//        "Fire Department",
//        "HVPNL",
//        "Irrigation",
//        "Nagar Parishad",
//        "PWD",
//        "PUBLIC HEALTH(Water)",
//        "Public health(Sewage)",
//        "Public health (Reny Well)",
//        "Social Welfare",
//        "Tehsil"
          dept(department, messageBubbles, messageBubble);
        }

        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }

  void dept(department, List<MessageBubble> messageBubbles,
      MessageBubble messageBubble) {
    if (email == 'animalhusb@test.com') {
      if (department == depts[1]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'bdpo@test.com') {
      if (department == depts[2]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'civilhosp@test.com') {
      if (department == depts[3]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'dhbvnurban@test.com') {
      if (department == depts[4]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'dhbvnrural@test.com') {
      if (department == depts[5]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'dtp@test.com') {
      if (department == depts[6]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'eduelementary@test.com') {
      if (department == depts[7]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'eduhigher@test.com') {
      if (department == depts[8]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'firedept@test.com') {
      if (department == depts[9]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'hvpnl@test.com') {
      if (department == depts[10]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'irrigation@test.com') {
      if (department == depts[11]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'nagarparishad@test.com') {
      if (department == depts[12]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'pwd@test.com') {
      if (department == depts[13]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'phwater@test.com') {
      if (department == depts[14]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'phsewage@test.com') {
      if (department == depts[15]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'phwell@test.com') {
      if (department == depts[16]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'socialwelfare@test.com') {
      if (department == depts[17]) {
        messageBubbles.add(messageBubble);
      }
    } else if (email == 'tehsil@test.com') {
      if (department == depts[18]) {
        messageBubbles.add(messageBubble);
      }
    }
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {this.complaintId,
      this.name,
      this.isMe,
      this.phone,
      this.address,
      this.date,
      this.remark,
      this.status,
      this.complaint,
      this.department,
      this.trackingId,
      this.remarks});

  final String complaintId;
  final String name;
  final bool isMe;
  final String phone;
  final String address;
  final String date;
  final String remark;
  final String status;
  final String complaint;
  final String department;
  final String trackingId;
  final String remarks;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              BottomSheet(
                // ignore: missing_return
                builder: (BuildContext context) {
                  SingleChildScrollView(
                    child: Container(
                      height: 10,
                      width: 10,
                    ),
                  );
                },
              );
//              _firestore
//                  .collection("complaints")
//                  .document(trackingId)
//                  .updateData(
//                {'colony': 'hi'},
//              );
              print('$address');
            },
            child: Card(
              elevation: 10,
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: Colors.blueGrey[700],
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '#$complaintId',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: status == 'Processing' ? Colors.red : Colors.green,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '$status',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Name:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' $name',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Phone Number:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' $phone',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Address:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' $address',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Date:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' $date',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Department:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' $department',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Complaint:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' $complaint',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Remark:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' $remarks',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
