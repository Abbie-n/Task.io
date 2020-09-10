import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskio/app/colors/taskio_colors.dart';
import 'package:taskio/app/responsiveness/size_config.dart';
import 'package:taskio/app/responsiveness/config_extensions.dart';
import 'package:taskio/ui/views/home/home_viewmodel.dart';
import 'package:taskio/ui/widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  final String userId;
  final config = SizeConfig();

  HomeView({this.userId});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<HomeViewModel>(context);
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: TaskioColors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10.width,
            vertical: 5.height,
          ),
          //child: FlatButton(child: Text('Click me'), onPressed: () => print(model.userId()))
          child: StreamBuilder<QuerySnapshot>(
            stream: model.fireStore
                .collection("users")
                .where('UID', isEqualTo: userId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Center(
                  child: Text(snapshot.error),
                );
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  return ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.getDate(),
                                      style: TextStyle(
                                        color:
                                            TaskioColors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 5.text,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.height,
                                    ),
                                    Text(
                                      'Hello, ${document['Full Name']}',
                                      style: TextStyle(
                                        color:
                                            TaskioColors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 5.5.text,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 6.5.height,
                                  width: 35.width,
                                  child: CustomButton(
                                    text: '+  Add task',
                                    function: () {
                                      model.navigateCreateTaskView(context);
                                    },
                                    color: TaskioColors.black,
                                    textColor: TaskioColors.grey[600],
                                    borderColor: TaskioColors.black,
                                    elevation: 1,
                                    radius: 2.height,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: TaskioColors.black,
                            thickness: 0.5.height,
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: model.fireStore
                                .collection('users')
                                .document(userId)
                                .collection('tasks')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError)
                                return Center(child: Text(snapshot.error));
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Center(
                                      child: CircularProgressIndicator());
                                default:
                                  return !snapshot.hasData
                                      ? Center(
                                          child: Text(
                                              'You have not assigned task'),
                                        )
                                      : Container(
                                          height: 60.height,
                                          child: ListView(
                                            children: snapshot.data.documents
                                                .map((DocumentSnapshot
                                                    document) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 30.height,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 3.height,
                                                          width: 0,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: TaskioColors
                                                                        .orange,
                                                                  )),
                                                        ),
                                                        Container(
                                                          height: 20.height,
                                                          width: 0,
                                                          margin:
                                                              EdgeInsets.only(
                                                            left: 5.width,
                                                          ),
                                                          decoration: BoxDecoration(
                                                              border: Border(
                                                                  right: BorderSide(
                                                                      color: TaskioColors
                                                                          .orange,
                                                                      width: 1
                                                                          .width))),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              );
                                            }).toList(),
                                          ),
                                        );
                              }
                            },
                          )
                        ],
                      );
                    }).toList(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
