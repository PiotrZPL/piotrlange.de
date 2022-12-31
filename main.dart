import 'package:dbml/dbml.dart';
import "partials/pageBase.dart";
import 'partials/brandLink.dart';
import 'partials/mdPages.dart';

void main() async {
  buildWebsite(
    Website(
      listOfHtml: [
        PageBase(
          path: "/index.html",
          title: "Piotr Lange",
          listOfWidgets: [
            Article(
              widget_class: "prose lg:prose-lg mx-auto mb-8 dark:prose-dark px-4",
              widgets: [
                Div(
                  widget_class: "grid place-content-center",
                  widgets: [
                    Img(
                      widget_class: "rounded-full w-44 md:w-96",
                      src: "/images/profile-fixed.webp"
                    )
                  ]
                ),
                Heading(
                  widget_class: "text-lg2xl text-center mb-0",
                  level: 1,
                  text: "Piotr Lange"
                ),
                Paragraph(
                  widget_class: "text-2xl text-center mt-0",
                  text: "I'm a young programmer, technology enthusiast and<br>IB Diploma Programme student in Gdyńska Trójka.<br>I'm interested in maths and computer engineering.<br>I use Arch BTW"
                ),
                Div(
                  widget_class: "flex justify-center",
                  widgets: [
                BrandLink(
                  widget_class: "h-30 w-30 p-2 inline-block rounded-full border border-transparent text-gray-900 hover:text-gray-900 hover:border-gray-900 cursor-pointer transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-white",
                  brand: "facebook",
                  link: "https://www.facebook.com/profile.php?id=100018056777388"
                ),
                BrandLink(
                  widget_class: "h-30 w-30 p-2 inline-block rounded-full border border-transparent text-gray-900 hover:text-gray-900 hover:border-gray-900 cursor-pointer transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-white",
                  brand: "github",
                  link: "https://github.com/PiotrZPL/"
                ),
                BrandLink(
                  widget_class: "h-30 w-30 p-2 inline-block rounded-full border border-transparent text-gray-900 hover:text-gray-900 hover:border-gray-900 cursor-pointer transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-white",
                  brand: "reddit",
                  link: "https://www.reddit.com/user/Piotr_Lange"
                )
                  ]
                )
              ]
            )
          ]
        ).toHtmlDoc()
      ] + renderMDPages()
    ),
    "tailwind.config.js"
  );
}