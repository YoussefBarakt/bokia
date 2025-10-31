import 'package:bokia/core/helper/DioServices.dart';
import 'package:bokia/core/helper/localServices.dart';
import 'package:bokia/feature/cubit/Repository/auth_cubit_bloc.dart';
import 'package:bokia/feature/ui/bookia_app/MaterialBookia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioServices.init();

  await LocalServices.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubitBloc()),
      ],
      child: ScreenUtilInit(
          designSize:  Size(375.sp, 812.sp),
          minTextAdapt: true,
          splitScreenMode: true,
          child: const Materialbookia()),
    ),
  );
}
