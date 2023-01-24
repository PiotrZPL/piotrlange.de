import 'package:dbml/dbml.dart';
import 'package:dart_emoji/dart_emoji.dart';
import 'utilities/get_flags.dart';

class LanguageSwitcher extends Hyperlink{
  LanguageSwitcher({
    required this.languageList,
    required this.currentLanguage
  }) : super(href: currentLanguage == "pl" ? "/" : "/pl/", text: EmojiParser().emojify(getFlags(currentLanguage)));
  List<String> languageList;
  String currentLanguage;
}