import 'package:dbml/dbml.dart';

class PostView extends Div {
  PostView({
    style,
    id,
    required this.datetext,
    required title,
    required this.description,
    required this.postLink,
    required this.imageLink
  }) : super(
    style: style,
    id: id,
    widget_class: "p-2",
    widgets: [
      Hyperlink(
        href: postLink,
        widgets: [
          Div(
            widget_class: "relative",
            widgets: [
              Img(
                widget_class: "rounded-lg shadow-sm w-full h-52 object-cover",
                src: imageLink
              ),
              Div(
                widget_class: "absolute top-4 right-4 rounded shadow bg-white text-gray-900 dark:bg-gray-900 dark:text-white text-sm px-2 py-0.5",
                widgets: [
                  Paragraph(
                    text: datetext
                  )
                ]
              )
            ]
          ),
          Div(
            widget_class: "my-2 text-xl font-bold",
            widgets: [
              Paragraph(
                text: title
              )
            ]
          ),
          Div(
            widgets: [
              Paragraph(
                text: description
              )
            ]
          ),
        ]
      )
    ]
  );

  String datetext = "";
  String description = "";
  String postLink = "";
  String imageLink = "";
}