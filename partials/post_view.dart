import 'package:staurolite/staurolite.dart';

class PostView extends Div {
  PostView({
    style,
    id,
    this.datetext,
    required title,
    required this.description,
    required this.postLink,
    required this.imageLink
  }) : super(
    style: style,
    id: id,
    properties: "p-2",
    children: [
      Hyperlink(
        href: postLink,
        children: [
          Div(
            properties: "relative",
            children: [
              Image(
                properties: "rounded-lg shadow-sm w-full h-52 object-cover",
                src: imageLink,
                alt: "post picture"
              ),
              datetext != null ? Div(
                properties: "absolute top-4 right-4 rounded shadow bg-white text-gray-900 dark:bg-gray-900 dark:text-white text-sm px-2 py-0.5",
                children: [
                  Paragraph(
                    text: datetext
                  )
                ]
              ) : null
            ]
          ),
          Div(
            properties: "my-2 text-xl font-bold",
            children: [
              Paragraph(
                text: title
              )
            ]
          ),
          Div(
            children: [
              Paragraph(
                text: description
              )
            ]
          ),
        ]
      )
    ]
  );

  String? datetext;
  String description = "";
  String postLink = "";
  String imageLink = "";
}