import 'dart:io';
import 'package:dbml/dbml.dart';
import 'pageBase.dart';

List<HtmlDoc> renderMDPages() {
  List<HtmlDoc> renderedPages = [];
  String pagesPath = "pages";
  Directory pagesDir = Directory(pagesPath);
  for (var entry in pagesDir.listSync().toList()) {
    if (entry is File) {
      renderedPages += [renderSingleMDPage(entry.path, entry.path.replaceFirst(pagesPath, ""))];
    }
    else if (entry is Directory) {
      stdout.write("Directory ${entry.path}\n");
    }
  }
  return renderedPages;
}

HtmlDoc renderSingleMDPage(String path, String finalPath) {
  File thisFile = File(path);
  String markdown = thisFile.readAsStringSync();
  return PageBase(
    path: "${finalPath.replaceAll(".md", "")}/index.html",
    title: "OK",
    listOfWidgets: [
      Article(
        widget_class: "prose lg:prose-lg mx-auto mb-8 dark:prose-dark px-4",
        widgets: [
          MarkdownElement(markdown: markdown)
        ]
      )
    ]
  ).toHtmlDoc();
}