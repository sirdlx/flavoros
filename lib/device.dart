import 'package:flavor/utilities/AppSettings.dart';
import 'package:flavor/components/Build/Page.dart';
import 'package:flavor/web/components/DLX/components.dart';
import 'package:flavor/web/components/Page/Page.dart';
import 'package:flavor/web/components/Page/splashpage.dart';
import 'package:flavor/web/components/Tiles/Tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



FlavorApp({bool device = false, Map<String, WidgetBuilder> routes}) {
  return ChangeNotifierProvider<AppSettingsModel>(
    builder: (context) =>
        AppSettingsModel(context, device: device, routes: routes),
    child: Consumer<AppSettingsModel>(
      builder: (_, settings, __) => FlavorMaterialApp(settings),
    ),
  );
}

class FlavorMaterialApp extends StatelessWidget {
  final AppSettingsModel settings;
  FlavorMaterialApp(this.settings);

  @override
  Widget build(BuildContext context) {
    // if (!settings.init) {
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     navigatorKey: settings.navigatorKey,
    //     theme: settings.theme,
    //     home: PageSplash(),
    //   );
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: settings.navigatorKey,
      theme: settings.theme,
      home: PageSplash(
      text: settings.title
      ),
      routes: settings.routes,
      onGenerateRoute: onGenerateRoute,
    );
  }

  MaterialPageRoute route(String path) {
    return MaterialPageRoute(
      builder: (context) {
        return BuildPage(
          pageJson: settings.pagesMap[path],
        );
      },
    );
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    var pathMatch = settings.pagesMap.containsKey(routeSettings.name);
    // print('pathMatch $pathMatch');

    return pathMatch
        ? route(settings.pagesMap[routeSettings.name])
        : MaterialPageRoute(
            builder: (context) {
              return PageError(
                msg: "Page '${routeSettings.name}' not found",
                errorCode: '404',
                title: 'Routes',
              );
            },
          );
  }
}

class AppShell extends StatelessWidget {
  final AppSettingsModel settings;
  AppShell(this.settings);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: settings.navigatorKey,
      theme: settings.theme,
      home: PageSplash(),
      routes: settings.routes,
      onGenerateRoute: onGenerateRoute,
    );
  }

  MaterialPageRoute route() {}

  Route onGenerateRoute(RouteSettings routeSettings) {
    var pathMatch = settings.pagesMap.containsKey(routeSettings.name);
    return pathMatch
        ? MaterialPageRoute(
            builder: (context) {
              return BuildPage(
                pageJson: settings.pagesMap[routeSettings.name],
              );
            },
          )
        : MaterialPageRoute(
            builder: (context) {
              return PageError(
                msg: "Page '${routeSettings.name}' not found",
                errorCode: '404',
                title: 'Routes',
              );
            },
          );
  }
}
// return MaterialPageRoute(
//     settings: routeSettings,
//     fullscreenDialog: true,
//     maintainState: true,
//     builder: (BuildContext context) => PageError(
//           msg: "Unable to load route ${routeSettings.name}",
//           errorCode: "404",
//           title: "${routeSettings.arguments ?? 'No Arguments'}",
//         ));

// return MaterialPageRoute(
//     builder: (_) => WillPopScope(
//           onWillPop: () {
//             settings = RouteSettings(name: '/');
//             return new Future.value(true);
//           },
//           child: SplashScreen(),
//         ));



// return MaterialPageRoute(
//     settings: routeSettings,
//     fullscreenDialog: true,
//     maintainState: true,
//     builder: (BuildContext context) => PageError(
//           msg: "Unable to load route ${routeSettings.name}",
//           errorCode: "404",
//           title: "${routeSettings.arguments ?? 'No Arguments'}",
//         ));

// return MaterialPageRoute(
//     builder: (_) => WillPopScope(
//           onWillPop: () {
//             settings = RouteSettings(name: '/');
//             return new Future.value(true);
//           },
//           child: SplashScreen(),
//         ));

class DefaultHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSettingsModel app = Provider.of<AppSettingsModel>(context);
    List<Widget> _pages = [];

    for (var _item in app.pagesMap.keys) {
      var itemInfo = app.pagesMap[_item];
      var type = itemInfo['type'];
      var title = itemInfo['title'] ?? _item;

      app.log.e(itemInfo.toString());
      if (type != 'splash' && type != 'onbording')
        _pages.add(ThumbTile(
          title: title,
          subtitle: 'page',
        ));
    }

    return PageShell(
      child: CustomScrollView(
        slivers: <Widget>[
          DLXSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: _pages,
            ),
          )
        ],
      ),
    );
  }
}
