import 'package:trigger_app/imports_bindings.dart';

///
class SplashView extends StatefulWidget {
  ///
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final StreamSubscription<InternetConnectionStatus> _connectionSubscription;
  late final SplashCubit cubit;

  @override
  void initState() {
    cubit = context.read<SplashCubit>();
    cubit.init();
    _connectionSubscription = InternetConnectionChecker().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.disconnected) {
        return;
      }
      cubit.init();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Text(
        'Trigger',
        style: context.theme.textTheme.displayLarge?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ).center,
    );
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }
}
