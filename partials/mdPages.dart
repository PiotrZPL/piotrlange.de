import 'dart:io';
import 'package:dbml/dbml.dart';
import 'pageBase.dart';

List<HtmlDoc> renderMDPages() {
  List<HtmlDoc> renderedPages = [];
  String pagesPath = "pages";
  Directory pagesDir = Directory(pagesPath);
  for (var entry in pagesDir.listSync().toList()) {
    if (entry is File) {
      renderedPages += [renderSingleMDPage(entry.path, pagesPath)];
    }
    else if (entry is Directory) {
      renderedPages += renderMDDirectory(entry.path, pagesPath);
    }
  }
  return renderedPages;
}

HtmlDoc renderSingleMDPage(String path, String pagesPath) {
  File thisFile = File(path);
  String markdown = thisFile.readAsStringSync();
  String finalPath = path.replaceFirst(pagesPath, "");
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

List<HtmlDoc> renderMDDirectory(String path, String pagesPath) {
  Directory thisDir = Directory(path);
  List<HtmlDoc> renderedPages = [];
  for (var entry in thisDir.listSync().toList()) {
    if (entry is File) {
      renderedPages += [renderSingleMDPage(entry.path, pagesPath)];
    }
    else if (entry is Directory) {
      renderedPages += renderMDDirectory(entry.path, pagesPath);
    }
  }
  return renderedPages;
}