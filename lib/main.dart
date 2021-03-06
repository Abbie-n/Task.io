import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskio/app/colors/taskio_colors.dart';
//import 'package:stacked_services/stacked_services.dart';
import 'package:taskio/app/providers/providers.dart';
import 'package:taskio/app/router/routes.gr.dart';
import 'package:taskio/core/models/user.dart';
import 'package:taskio/core/services/auth.dart';

import 'app/locator.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Taskio(),
    );
  }
}

class Taskio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    rebuildAllChildren(context);
    return StreamProvider<User>.value(
      value: locator<AuthServiceImpl>().user,
          child: MaterialApp(
        theme: ThemeData(
          primaryColor: TaskioColors.grey[700]
        ),
        debugShowCheckedModeBanner: false,
        title: 'Task.io',
        //navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: Router(),
        initialRoute: Routes.splashScreenView,
        
      ),
    );
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
