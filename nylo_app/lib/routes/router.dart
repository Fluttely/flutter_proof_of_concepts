import 'package:updown_app/resources/pages/examples/device_settings_page.dart';
import 'package:updown_app/resources/pages/main_page.dart';

import '../resources/pages/examples/state_management_example_page.dart';
import '../resources/pages/examples/local_storage_example_page.dart';
import '../resources/pages/examples/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.x/router
|--------------------------------------------------------------------------
*/

appRouter() => nyRoutes((router) {
      router.route(MainPage.path, (context) => MainPage(), initialRoute: true);
      router.route(HomePage.path, (context) => HomePage());
      router.route(StateManagementExamplePage.path,
          (context) => StateManagementExamplePage(),
          pageTransitionSettings: PageTransitionSettings());
      router.route(
          LocalStorageExamplePage.path, (context) => LocalStorageExamplePage());
      router.route(DeviceSettingsPage.path, (context) => DeviceSettingsPage());
    });
