import 'package:trigger_app/imports_bindings.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

///
class SplashCubit extends Cubit<SplashState> {
  ///
  SplashCubit() : super(const SplashState());

  ///*
  Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    emit(state.copyWith(packageInfo: packageInfo));

    await Future<void>.delayed(const Duration(seconds: 3));

    // Checking update available or not
    if (Platform.isAndroid || Platform.isIOS) {
      await UpdateServices.checkForUpdates(packageInfo: packageInfo, appleId: '');
    }

    // final token = App.navKey.currentContext?.read<AuthCubit>().state.token;
    App.navKey.currentContext?.pushAndRemoveUntil(
      switch ('token') {
        // null => const LoginScreen(),
        _ => const DashBoardScreen(),
      },
    );
  }
}
