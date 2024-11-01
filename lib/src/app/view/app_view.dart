import 'package:trigger_app/imports_bindings.dart';
import 'package:trigger_app/src/app/view/splash_view.dart';

///* First widget integrating
class App extends StatelessWidget {
  ///*
  const App({super.key});

  ///* For getting navigation status globally
  ///* eg:context,current state...
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Sizer.init(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SplashCubit()),
          BlocProvider(create: (_) => AppCubit()),
          BlocProvider(create: (_) => DashboardCubit()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return MaterialApp(
              navigatorKey: navKey,
              debugShowCheckedModeBanner: false,
              themeMode: state.themeMode,
              theme: AppThemes.light,
              darkTheme: AppThemes.dark,
              locale: state.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const SplashView(),
            );
          },
        ),
      ),
    );
  }
}
