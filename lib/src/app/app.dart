import 'package:clz/src/core/config/get_it.dart';
import 'package:clz/src/core/config/keyboard.dart';
import 'package:clz/src/core/localization/cubit.dart';
import 'package:clz/src/core/services/message_service.dart';
import 'package:clz/src/core/theme/cubit.dart';
import 'package:clz/src/core/utility/typedef.dart';
import 'package:clz/src/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, _) => false,
      child: MultiBlocProvider(
        providers: [
          // BlocProvider<AppBloc>(lazy: false, create: (_) => getIt<AppBloc>()),
          // BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
          BlocProvider(create: (_) => getIt<ThemeCubit>()),
          // BlocProvider(create: (_) => getIt<NavigationCubit>()),
          BlocProvider(create: (_) => getIt<LocaleCubit>()),
        ],
        child: const MainAppView(),
      ),
    );
  }
}

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  @override
  void initState() {
    // PushNotification.onMessagingListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: DismissKeyboard(
        child: AppThemeChange(
          builder: (context, theme) {
            return BlocBuilder<LocaleCubit, String>(
              builder: (context, locale) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'BiteUp',
                  navigatorKey: NavigatorService.key,
                  theme: theme,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  initialRoute: RoutesName.initial,
                  onGenerateRoute: AppRoute.generate,
                  builder: MessageTote.builder,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class AppThemeChange extends StatelessWidget {
  const AppThemeChange({super.key, required this.builder});
  final ThemeBuilder builder;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: theme.isDark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          child: builder(context, theme),
        );
      },
    );
  }
}
