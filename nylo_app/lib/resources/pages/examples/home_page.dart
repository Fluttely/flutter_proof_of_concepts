import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import 'package:updown_app/bootstrap/extensions.dart';
// import 'package:updown_app/bootstrap/helpers.dart';
import 'package:updown_app/resources/pages/examples/device_settings_page.dart';
import 'package:updown_app/resources/pages/examples/local_storage_example_page.dart';
import 'package:updown_app/resources/pages/examples/state_management_example_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';

import 'package:updown_app/app/controllers/home_controller.dart';
import 'package:updown_app/resources/widgets/safearea_widget.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static const path = '/home-page';

  HomePage() : super(path, child: _HomePagePageState());
}

class _HomePagePageState extends NyState<HomePage> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello world".tr()),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: widget.controller.showAbout,
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SafeAreaWidget(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo(),
              Text(
                getEnv("APP_NAME"),
              ).displayMedium(context),
              // Text("Micro-framework for Flutter", textAlign: TextAlign.center)
              //     .titleMedium(context)
              //     .setColor(context, (color) => color.primaryAccent),
              // Text(
              //   "Build something amazing 💡",
              // ).bodyMedium(context).alignCenter(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Divider(),
                  // Container(
                  //   height: 250,
                  //   width: double.infinity,
                  //   margin:
                  //       EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  //   padding:
                  //       EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  //   decoration: BoxDecoration(
                  //       color: ThemeColor.get(context).surfaceBackground,
                  //       borderRadius: BorderRadius.circular(8),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.1),
                  //           spreadRadius: 1,
                  //           blurRadius: 9,
                  //           offset: Offset(0, 3),
                  //         ),
                  //       ]),
                  //   child: Center(
                  //     child: ListView(
                  //       padding: EdgeInsets.zero,
                  //       shrinkWrap: true,
                  //       children:
                  //           ListTile.divideTiles(context: context, tiles: [
                  //         MaterialButton(
                  //           child: Text(
                  //             "documentation".tr().capitalize(),
                  //           ).bodyLarge(context).setColor(
                  //               context, (color) => color.surfaceContent),
                  //           onPressed: widget.controller.onTapDocumentation,
                  //         ),
                  //         MaterialButton(
                  //           child: Text(
                  //             "GitHub",
                  //           ).bodyLarge(context).setColor(
                  //               context, (color) => color.surfaceContent),
                  //           onPressed: widget.controller.onTapGithub,
                  //         ),
                  //         MaterialButton(
                  //           child: Text(
                  //             "changelog".tr().capitalize(),
                  //           ).bodyLarge(context).setColor(
                  //               context, (color) => color.surfaceContent),
                  //           onPressed: widget.controller.onTapChangeLog,
                  //         ),
                  //         MaterialButton(
                  //           child: Text(
                  //             "YouTube Channel".tr().capitalize(),
                  //           ).bodyLarge(context).setColor(
                  //               context, (color) => color.surfaceContent),
                  //           onPressed: widget.controller.onTapYouTube,
                  //         ),
                  //       ]).toList(),
                  //     ),
                  //   ),
                  // ),
                  Text(
                    "Framework Version: $nyloVersion",
                  )
                      .bodyMedium(context)
                      .setColor(context, (color) => Colors.grey),
                  if (!context.isDarkMode)
                    Switch(
                        value: isThemeDark,
                        onChanged: (_) {
                          NyTheme.set(context,
                              id: getEnv(isThemeDark != true
                                  ? 'DARK_THEME_ID'
                                  : 'LIGHT_THEME_ID'));
                        }),
                  if (!context.isDarkMode)
                    Text("${isThemeDark ? "Dark" : "Light"} Mode"),
                  ElevatedButton(
                    onPressed: () {
                      routeTo(StateManagementExamplePage.path);
                    },
                    child: Text('Go to State Management Example Page'),
                  ),
                  Divider(),
                  ElevatedButton(
                    onPressed: () {
                      routeTo(LocalStorageExamplePage.path);
                    },
                    child: Text('Go to Local Storage Example Page'),
                  ),
                  Divider(),
                  ElevatedButton(
                    onPressed: () {
                      routeTo(DeviceSettingsPage.path);
                    },
                    child: Text('Go to Settings Page'),
                  ),
                  // SizedBox(height: 200),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get isThemeDark =>
      ThemeProvider.controllerOf(context).currentThemeId ==
      getEnv('DARK_THEME_ID');
}
