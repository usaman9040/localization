import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:localization/Provider/locale_provider.dart';
import 'package:localization/Widget/language_picker_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: const [
          LanguagePickerWidget()
        ],
      ),
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.hello("user!"),
          style: const TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}