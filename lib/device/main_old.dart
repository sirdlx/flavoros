import 'components/Build/apiApp.dart';
import 'components/Build/buildApp.dart';
import 'components/Page/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'apps/dlxstudios/dlxstudios.dart';

void main() => runApp(DlxApp());

// void main() => runApp(DLXApp());

class DLXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModelJsonFB>(
        create: (_) => AppModelJsonFB(),
        child: Consumer<AppModelJsonFB>(builder: (context, app, child) {
          app.isLoading
              ? print('app is loading docs')
              : print('app has finished loading docs');

          return app.isLoading
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.dark,
                  home: PageSplash(),
                )
              : BuildApp(app);

          // return Home();
        }));
  }
}
