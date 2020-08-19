import 'package:XLLogger/repo/local_hive/pref_box.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initDependencies() async {
  print("initDependencies()");
  final getIt = GetIt.instance;

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  /*getIt.registerSingletonAsync<RepoProvider>(
        () => RepoProvider.getInstance(
      apiProvider: APIProviderIml(),
      networkInfo: NetworkInfoImpl(
        dataConnectionChecker,
      ),

    ),
  );*/

  getIt.registerSingletonAsync<PrefBox>(
    () => PrefBox.getInstance(),
  );
}
