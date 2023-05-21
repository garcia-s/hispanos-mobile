import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/pages/index_page/index_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hispanosmobile/pages/post/post_page.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const Application();
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        '/': (_) => const IndexPage(),
        "/post": (_) => const PostPage(),
        "/podcasts": (_) => Container(),
        "/magazines": (_) => Container(),
        "/podcast": (_) => Container(),
      },
    );
  }
}
