import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_taking_app/core/helper/bloc_observer.dart';
import 'package:note_taking_app/core/helper/open_multi_boxes.dart';
import 'package:note_taking_app/core/routes/routes.dart';
import 'package:note_taking_app/core/helper/services_locator.dart';
import 'package:note_taking_app/core/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note_taking_app/core/utils/constants/boxes.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:note_taking_app/features/home/data/models/sections_model.dart';
import 'package:note_taking_app/features/home/domain/use_cases/home_use_case_imp.dart';
import 'package:note_taking_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:note_taking_app/features/notes/domain/entites/notes_entity.dart';
import 'package:note_taking_app/features/notes/domain/use_cases/notes_use_cases_impl.dart';
import 'package:note_taking_app/features/notes/presentation/manager/cubit/notes_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );
  // Initialize dependencies
  setupDependencies();

  // Initialize Hive for Flutter
  await Hive.initFlutter();
  Hive.registerAdapter(NotesEntityAdapter());

  // Open the general box
  await Hive.openBox<SectionsModel>(sectionsBox);
  Hive.registerAdapter(SectionsModelAdapter());

  // Open the notes boxes
  await openNotesBoxes();

  // Set Bloc observer for debugging
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            gitIt<HomeUseCaseImpl>(),
          )..fetchSections(),
        ),
        BlocProvider(
          create: (context) => NotesCubit(
            gitIt<NotesUseCasesImpl>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Note Taking',
        theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: AppColors.scaffoldColor,
          //iconTheme: IconThemeData(color: AppColors.primaryColor),
          iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              iconColor: WidgetStatePropertyAll(
                AppColors.primaryColor,
              ),
            ),
          ),
          //useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
