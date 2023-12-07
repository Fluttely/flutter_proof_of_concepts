import 'package:updown_app/app/providers/auth_provider.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:updown_app/app/providers/app_provider.dart';
import 'package:updown_app/app/providers/event_provider.dart';
import 'package:updown_app/app/providers/route_provider.dart';

/*
|--------------------------------------------------------------------------
| Providers
| Add your "app/providers" here.
| Providers are booted when your application start.
|
| Learn more: https://nylo.dev/docs/5.x/providers
|--------------------------------------------------------------------------
*/

final Map<Type, NyProvider> providers = {
  AppProvider: AppProvider(),
  RouteProvider: RouteProvider(),
  EventProvider: EventProvider(),
  AuthProvider: AuthProvider(),
};
