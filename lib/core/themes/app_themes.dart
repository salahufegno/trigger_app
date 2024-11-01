import 'package:trigger_app/imports_bindings.dart';

///*
@immutable
sealed class AppThemes {
  ///*
  static final light = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppStyles.text16Px.interMedium.light,
        padding: EdgeInsets.all(16.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixStyle: const TextStyle(fontSize: 14),
      focusColor: AppColors.dark,
      // floatingLabelStyle: AppStyles.text18Px.interRegular,
      labelStyle: AppStyles.text16Px.interRegular.dark,
      hintStyle: AppStyles.text16Px.interRegular.copyWith(color: Colors.grey.shade600),
      errorStyle: AppStyles.text14Px.interRegular.error,

      /// Error
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.error,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.error,
        ),
      ),

      ///
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.primary.withOpacity(.5),
          width: 2,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.primary.withOpacity(.5),
          width: 2,
        ),
      ),
    ),
  );

  ///*
  static final dark = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppStyles.text16Px.interMedium.dark,
        padding: EdgeInsets.all(16.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixStyle: const TextStyle(fontSize: 14),
      focusColor: AppColors.primary,

      //    floatingLabelStyle: AppStyles.text18Px.interRegular,
      labelStyle: AppStyles.text16Px.interRegular,
      hintStyle: AppStyles.text16Px.interRegular,
      errorStyle: AppStyles.text14Px.interRegular.error,
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.error,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.error,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.light,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.light,
        ),
      ),
    ),
  );
}
