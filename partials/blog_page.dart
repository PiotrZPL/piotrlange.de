import 'package:staurolite/staurolite.dart';
import 'page_base.dart';
import 'post_view.dart';

class BlogPage {

  HtmlDoc toHtmlDoc() {
    return PageBase(
      path: "/blog/index.html",
      title: "Blog - Piotr Lange",
      listOfWidgets: [
        Article(
          properties: "prose lg:prose-lg mx-auto my-8 dark:prose-dark px-4",
          children: [
            Heading(
              properties: "text-center mb-0",
              level: 1,
              text: "Piotr Lange's blog"
            ),
            Paragraph(
              properties: "text-2xl text-center mt-0",
              text: "This part of the website is not yet finished."
            ),
          ]
        ),
        Div(
          properties: "container p-6 mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 lg:gap-8",
          children: [
            PostView(
              datetext: "OK",
              title: "First Post",
              description: "Hello world!",
              postLink: "https://piotrlange.de/",
              imageLink: "/images/N90.jpg"
            ),
            PostView(
              datetext: "OK",
              title: "Second Post",
              description: "Hello world, again!",
              postLink: "https://piotrlange.de/",
              imageLink: "/images/N90.jpg"
            ),
            PostView(
              datetext: "19.10.2022",
              title: "Next post",
              description: "This is the next post",
              postLink: "https://piotrlange.de/",
              imageLink: "/images/N90.jpg"
            )
          ]
        )
      ]
    ).toHtmlDoc();
  }
}