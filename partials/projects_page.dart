import 'package:dbml/dbml.dart';
import 'pageBase.dart';
import 'post_view.dart';

class ProjectsPage {

  HtmlDoc toHtmlDoc() {
    return PageBase(
      path: "/projects/index.html",
      title: "Projects - Piotr Lange",
      listOfWidgets: [
        Article(
          widget_class: "prose lg:prose-lg mx-auto my-8 dark:prose-dark px-4",
          widgets: [
            Heading(
              widget_class: "text-center mb-0",
              level: 1,
              text: "My projects"
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
            PostView(
              title: "PrimeCheck",
              description: "A simple math program",
              postLink: "/projects/primecheck/",
              imageLink: "/images/primecheck.webp"
            ),
            PostView(
              title: "BinCalc",
              description: "Convert numbers and make calculations using binary numbers with minimal effort!",
              postLink: "https://github.com/PiotrZPL/BinCalc",
              imageLink: "/images/bincalc.webp"
            ),
            PostView(
              title: "GCF&LCM",
              description: "Find the Greatest Common Factors and Lowest Common Multiples of different numbers.",
              postLink: "https://github.com/PiotrZPL/GCFandLCM",
              imageLink: "/images/gcfandlcm.webp"
            )
          ]
        )
      ]
    ).toHtmlDoc();
  }
}