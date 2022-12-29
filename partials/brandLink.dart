import 'dart:io';
import 'package:dbml/dbml.dart';

class BrandLink extends HtmlWidget {
  BrandLink ({
    widget_class,
    style,
    id,
    title,
    required this.brand,
    this.link
  }) : super(widget_class: widget_class, style: style, id: id, title: title);

  String brand;
  String? link;

  @override
  String toHTML() {
    String brandsvg = File("brands/$brand.svg").readAsStringSync();
    brandsvg = brandsvg.replaceFirst("svg ", """svg class="fill-current" width="50" height="40" """);
    return Hyperlink(
      widget_class: widget_class,
      href: link,
      text: brandsvg
    ).toHTML();
  }
}