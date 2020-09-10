import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taskio/app/colors/taskio_colors.dart';
import 'package:taskio/app/responsiveness/size_config.dart';
import 'package:taskio/app/responsiveness/config_extensions.dart';
import 'package:taskio/ui/views/home/home_viewmodel.dart';
import 'package:taskio/ui/widgets/custom_button.dart';
import 'package:taskio/ui/views/home/home_widgets/task_container.dart';
import 'package:taskio/ui/views/home/home_widgets/heading_container.dart';

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
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  return ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return Column(
                        children: [
                          HeadingContainer(
                            date: model.getDate(),
                            name: document['Full Name'],
                            function: () {
                              model.navigateCreateTaskView(context);
                            },
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: model.fireStore
                                .collection('users')
                                .document(userId)
                                .collection('tasks')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError)
                                return Center(
                                  child: Text(snapshot.error),
                                );
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                default:
                                  return Container(
                                    height: 60.height,
                                    child: ListView(
                                      children: snapshot.data.documents.map(
                                        (DocumentSnapshot document) {
                                          String startDate =
                                              DateFormat('MMM d').format(
                                            document['Start date'].toDate(),
                                          );
                                          String endDate = DateFormat('MMM d')
                                              .format(document['End date']
                                                  .toDate());
                                          return document['Heading'] == ''
                                              ? Container(
                                                  margin: EdgeInsets.only(
                                                    top: 35.height,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'You do not have any assigned task!',
                                                      style: TextStyle(
                                                        color: TaskioColors
                                                            .grey[700],
                                                        fontSize: 4.text,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : TaskContainer(
                                                  complete: model.complete,
                                                  // heading: ,
                                                  // description: ,
                                                  startDate: startDate ?? '',
                                                  endDate: endDate ?? '',
                                                );
                                        },
                                      ).toList(),
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
