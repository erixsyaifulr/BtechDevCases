import 'package:get_it/get_it.dart';

import 'bloc_injection.dart';
import 'client_injection.dart';
import 'datasource_injection.dart';
import 'repository_injection.dart';
import 'route_injection.dart';
import 'storage_injection.dart';

final getIt = GetIt.instance;

class Injector {
  static Future<void> initialize() async {
    //* Bloc Injection
    BlocInjection.init();

    //* Repository Injection
    RepositoryInjection.init();

    //* Storage Injection
    StorageInjection.init();

    //* Router Injection
    RouteInjection.init();

    //* Data source injection
    DatasourceInjection.init();

    //* Client Injection
    ClientInjection.init();
  }
}
