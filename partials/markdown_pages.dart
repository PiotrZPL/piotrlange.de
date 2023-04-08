import 'dart:io';
import 'package:staurolite/staurolite.dart';
import 'page_base.dart';
import 'package:yaml/yaml.dart';

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
  String finalMarkdown = markdown;

  String description = "Markdown generated file";
  String title = "Markdown generated file";

  if (markdown.startsWith("---")) {
    List<String> mardkownSplit = markdown.split("---");
    if (mardkownSplit.length > 1) {
      String yamlString = mardkownSplit[1];
      try {
        YamlMap yamlContent = loadYaml(yamlString);
        if (yamlContent.containsKey("title")) {
          title = yamlContent["title"].toString();
        }
        if (yamlContent.containsKey("description")) {
          description = yamlContent["description"].toString();
        }

        mardkownSplit.removeAt(0);
        mardkownSplit.removeAt(0);
        finalMarkdown = mardkownSplit.join("---");
      }
      catch (e) {
        // OK
      }
    }
  }

  String finalPath = path.replaceFirst(pagesPath, "");
  return PageBase(
    path: "${finalPath.replaceAll(".md", "")}/index.html",
    title: title,
    description: description,
    listOfWidgets: [
      Article(
        properties: "prose lg:prose-lg mx-auto mb-8 dark:prose-dark px-4",
        children: [
          MarkdownElement(markdown: finalMarkdown)
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