import 'package:dbml/dbml.dart';
import 'pageBase.dart';

class BlogPage {

  HtmlDoc toHtmlDoc() {
    return PageBase(
      path: "/blog/index.html",
      title: "Blog - Piotr Lange",
      listOfWidgets: [
        Article(
          widget_class: "prose lg:prose-lg mx-auto my-8 dark:prose-dark px-4",
          widgets: [
            Heading(
              widget_class: "text-center mb-0",
              level: 1,
              text: "Piotr Lange's blog"
            ),
            Paragraph(
              widget_class: "text-2xl text-center mt-0",
              text: "This part of the website is not yet finished."
            ),
          ]
        ),
        Div(
          widget_class: "container p-6 mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 lg:gap-8",
          widgets: [
            Div(
              widget_class: "p-2",
              widgets: [
                Hyperlink(
                  href: "https://piotrlange.de/",
                  widgets: [
                    Div(
                      widget_class: "relative",
                      widgets: [
                        Img(
                          widget_class: "rounded-lg shadow-sm w-full h-52 object-cover",
                          src: "/images/N90.jpg"
                        ),
                        Div(
                          widget_class: "absolute top-4 right-4 rounded shadow bg-white text-gray-900 dark:bg-gray-900 dark:text-white text-sm px-2 py-0.5",
                          widgets: [
                            Paragraph(
                              text: "OK"
                            )
                          ]
                        )
                      ]
                    ),
                    Div(
                      widget_class: "my-2 text-xl font-semibold",
                      widgets: [
                        Paragraph(
                          text: "First post"
                        )
                      ]
                    ),
                    Div(
                      widgets: [
                        Paragraph(
                          text: "Hello world!"
                        )
                      ]
                    ),
                  ]
                )
              ]
            ),
            Div(
              widget_class: "p-2",
              widgets: [
                Hyperlink(
                  href: "https://piotrlange.de/",
                  widgets: [
                    Div(
                      widget_class: "relative",
                      widgets: [
                        Img(
                          widget_class: "rounded-lg shadow-sm w-full h-52 object-cover",
                          src: "/images/N90.jpg"
                        ),
                        Div(
                          widget_class: "absolute top-4 right-4 rounded shadow bg-white text-gray-900 dark:bg-gray-900 dark:text-white text-sm px-2 py-0.5",
                          widgets: [
                            Paragraph(
                              text: "OK"
                            )
                          ]
                        )
                      ]
                    ),
                    Div(
                      widget_class: "my-2 text-xl font-semibold",
                      widgets: [
                        Paragraph(
                          text: "Post 2"
                        )
                      ]
                    ),
                    Div(
                      widgets: [
                        Paragraph(
                          text: "Hello world, again!"
                        )
                      ]
                    ),
                  ]
                )
              ]
            )
          ]
        )
      ]
    ).toHtmlDoc();
  }
}