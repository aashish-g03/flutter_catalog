import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttercatalog/app_theme.dart';
import 'package:fluttercatalog/routes/router.gr.dart';
import 'package:fluttercatalog/values/values.dart';

import 'bloc/theme_bloc.dart';

//TODO:: Module name: "Menus":
//TODO:: Module name: "Messages & Notifications" Add 1. Messages 2. Notifications 3. Categories
//TODO:: Module name: "Chats" Add 1. Messages chat 2. Chats  --> maybe
//TODO:: Module name: find UI for settings or probably ignore it

void main() {
  runApp(FlutterCatalog());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class FlutterCatalog extends StatefulWidget {
  @override
  _FlutterCatalogState createState() => _FlutterCatalogState();
}

class _FlutterCatalogState extends State<FlutterCatalog> {
  late ThemeBloc _themeBloc;
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    _themeBloc = ThemeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      initialData: _themeBloc.initialTheme().data,
      stream: _themeBloc.themeDataStream,
      builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
        // return MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   theme: snapshot.data,
        //   darkTheme: null,
        //   builder: ExtendedNavigator<AppRouter>(
        //     router: AppRouter(),
        //     initialRoute: Routes.rootScreen,
        //     initialRouteArgs: RootScreenArguments(themeBloc: _themeBloc),
        //     observers: [routeObserver],
        //   ),
        // );

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: snapshot.data,
          title: StringConst.APP_NAME,
          routerDelegate: _appRouter.delegate(
            initialRoutes: [
              RootScreenRoute(themeBloc: _themeBloc)
            ]
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
        );
      },
    );
  }
}
