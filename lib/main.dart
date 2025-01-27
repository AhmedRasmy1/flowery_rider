import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/di/di.dart';
import 'core/resources/routes_manager.dart';
import 'core/utils/cashed_data_shared_preferences.dart';
import 'core/utils/my_bloc_observer.dart';
import 'firebase_options.dart';
import 'localization/locale_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheService.cacheInitialization();
  configureDependencies();
  EasyLoading.init();
  Bloc.observer = MyBlocObserver();
  runApp(const FlowerRider());
}

class FlowerRider extends StatelessWidget {
  const FlowerRider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            locale: locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('ar'), // Arabic
            ],
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,

            initialRoute: RoutesManager.onBoarding,
            //home: HomeView(),
            // initialRoute: RoutesManager.onBoarding,

            //home: OrderDetailsView(),
          );
        },
      ),
    );
  }
}
