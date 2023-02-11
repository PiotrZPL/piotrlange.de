import 'dart:io';
import 'package:staurolite/staurolite.dart';

class BrandLink extends HtmlWidget {
  BrandLink ({
    properties,
    style,
    id,
    title,
    required this.brand,
    this.link,
    this.width = 50,
    this.height = 40,
  }) : super(properties: properties, style: style, id: id, title: title);

  String brand;
  String? link;
  int width = 50;
  int height = 40;

  @override
  String toHTML() {
    String brandsvg = File("brands/$brand.svg").readAsStringSync();
    brandsvg = brandsvg.replaceFirst("svg ", """svg class="fill-current" width="$width" height="$height" """);
    return Hyperlink(
      properties: properties,
      href: link,
      text: brandsvg
    ).toHTML();
  }
}