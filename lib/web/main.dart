import 'package:flavor/flavor.dart';
import 'package:flavor/web/components/Build/Page.dart';

import 'components/Page/Onboard.dart';
import 'components/Page/Page.dart';
import 'components/Page/splashpage.dart';
import 'package:flavor/utilities/AppSettings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/Page/dashboard.dart';

void main() => runApp(
      ChangeNotifierProvider<AppSettingsModel>(
        create: (context) => AppSettingsModel(context),
        child: Consumer<AppSettingsModel>(
          builder: (_, settings, __) => AppShell(settings),
        ),
      ),
    );

