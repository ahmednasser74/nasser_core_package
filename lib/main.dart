import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasser_core_package/example/models.dart';
import 'package:nasser_core_package/example/repository.dart';
import 'package:nasser_core_package/src/app_dropdown/index.dart';
import 'package:nasser_core_package/src/core/index.dart';
import 'package:nasser_core_package/src/core/enum/index.dart';
import 'package:nasser_core_package/src/core/extensions/index.dart';
import 'package:nasser_core_package/src/core/network/index.dart';
import 'package:nasser_core_package/src/res/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  nasserCorePackageConfigureDependencies();
  await EasyLocalization.ensureInitialized();
  BaseRequestDefaults.instance.setBaseUrl('https://sisdev2.midocean.ae/api/');
  BaseRequestDefaults.instance.setToken('41700|KVAsb6nTjtDOGSjWzsBgz3OiI7Lv4KWugsILEcfc');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/langs',
      saveLocale: true,
      supportedLocales: [Locale(Language.ar.value), Locale(Language.en.value)],
      fallbackLocale: Locale(Language.en.value),
      startLocale: Locale(Language.en.value),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: child,
          );
        },
        child: const MyHomePage(title: 'Nasser'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final AppCache _cache = getIt<AppCache>();
  final ExampleRepository exampleRepo = getIt<ExampleRepository>();
  AppDropdownController<LoginResponseModel> dropDownController = AppDropdownController<LoginResponseModel>();

  void _incrementCounter() async {
    exampleRepo.getData(requestModel: LoginRequestModel(email: '920212005171', password: 'Mu\$03355s'));
    // final foundedData = await exampleRepo.getData(requestModel: LoginRequestModel(email: '920212005171', password: 'Mu\$03355s'));
    // print(foundedData.results!.map((e) => print(e)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildReceiverCompany(),
            12.heightBox,
            AppButton(
              onPressed: () => context.languageIsAr ? context.updateLanguage(Language.en) : context.updateLanguage(Language.ar),
              title: 'update language',
            ),
            12.heightBox,
            AppTextFieldWidget(
              validator: (v) => v!.passwordValidator(),
            ),
            12.heightBox,
            AppButton(
              onPressed: () {
                // final login = LoginResponseModel(id: 1, item: 'a', total: 2);
                // _cache.set('data', login.toJson());
                // final x = await _cache.getObjectFromJson<LoginResponseModel>(
                //   object: LoginResponseModel(),
                //   key: 'data',
                // );
              },
              title: 'cache object',
            ),
            12.heightBox,
            Text('name'.translate, style: TextStyle(fontSize: 18.sp)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildReceiverCompany() {
    return AppDropDownFetch<LoginResponseModel>(
      title: 'title',
      controller: dropDownController,
      caller: (model) => exampleRepo.getData(
        requestModel: LoginRequestModel(email: '920212005171', password: 'Mu\$03355s'),
      ),
    );
  }
}
