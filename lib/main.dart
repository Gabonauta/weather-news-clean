import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:weather/config/routes/routes.dart';
import 'package:weather/config/theme/app_themes.dart';
import 'package:weather/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:weather/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:weather/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:weather/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const DailyNews(),
      ),
    );
  }
}
