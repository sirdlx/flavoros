import 'package:flavor/flavor.dart';
import 'package:flavor/utilities/AppSettings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<AppSettingsModel>(
        create: (context) => AppSettingsModel(context),
        child: Consumer<AppSettingsModel>(
          builder: (_, settings, __) => AppShell(settings),
        ),
      ),
    );
