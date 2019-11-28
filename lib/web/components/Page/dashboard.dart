import '../../components/DLX/components.dart';
import '../../components/Tiles/Tiles.dart';
import 'package:flutter/material.dart';

class PageDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        DLXSliverAppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: DLXSearchButton(),
          trailing: DLXAvatarDropdown(),
          // overlapsContent: true,
          // expandedHeight: 300,
        ),
        // DLXSliverBox(),
      ],
    );
  }
}
