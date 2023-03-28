import 'package:staurolite/staurolite.dart';
import "partials/pageBase.dart";
import 'partials/brandLink.dart';
import 'partials/mdPages.dart';
import 'partials/blog_page.dart';
import 'partials/projects_page.dart';
import 'partials/projects/primecheck_page.dart';

void main() async {
  buildWebsite(
    Website(
      listOfHtml: [
        PageBase(
          path: "/index.html",
          title: "Piotr Lange",
          listOfWidgets: [
            Article(
              properties: "prose lg:prose-lg mx-auto mb-8 dark:prose-dark px-4",
              children: [
                Div(
                  properties: "grid place-content-center",
                  children: [
                    Image(
                      properties: "rounded-full w-44 md:w-96",
                      src: "/images/profile-fixed.webp",
                      alt: "profile picture"
                    )
                  ]
                ),
                Heading(
                  properties: "text-lg2xl text-center mb-0",
                  level: 1,
                  text: "Piotr Lange"
                ),
                Paragraph(
                  properties: "text-2xl text-center mt-0",
                  text: "I'm a young programmer, technology enthusiast and<br>IB Diploma Programme student in Gdyńska Trójka.<br>I'm interested in maths and computer engineering.<br>I use Arch BTW"
                ),
                Div(
                  properties: "flex justify-center",
                  children: [
                    BrandLink(
                      properties: "h-30 w-30 p-2 inline-block rounded-full border border-transparent text-gray-900 hover:text-gray-900 hover:border-gray-900 cursor-pointer transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-white",
                      brand: "facebook",
                      link: "https://www.facebook.com/profile.php?id=100018056777388"
                    ),
                    BrandLink(
                      properties: "h-30 w-30 p-2 inline-block rounded-full border border-transparent text-gray-900 hover:text-gray-900 hover:border-gray-900 cursor-pointer transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-white",
                      brand: "github",
                      link: "https://github.com/PiotrZPL/"
                    ),
                    BrandLink(
                      properties: "h-30 w-30 p-2 inline-block rounded-full border border-transparent text-gray-900 hover:text-gray-900 hover:border-gray-900 cursor-pointer transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-white",
                      brand: "reddit",
                      link: "https://www.reddit.com/user/Piotr_Lange"
                    )
                  ]
                )
              ]
            )
          ]
        ).toHtmlDoc(),
        PageBase(
          path: "/pl/index.html",
          language: "pl",
          title: "Piotr Lange",
          listOfWidgets: [
            Article(
              properties: "prose lg:prose-lg mx-auto mb-8 dark:prose-dark px-4",
              children: [
                Div(
                  properties: "grid place-content-center",
                  children: [
                    Image(
                      properties: "rounded-full w-44 md:w-96",
                      src: "/images/profile-fixed.webp",
                      alt: "profile picture"
                    )
                  ]
                ),
                Heading(
                  properties: "text-lg2xl text-center mb-0",
                  level: 1,
                  text: "Piotr Lange"
                ),
                Paragraph(
                  properties: "text-2xl text-center mt-0",
                  text: "Jestem młodym programistą, entuzjastą technologii<br>i uczniem klasy matury międzynarodowej w Gdyńskiej Trójce.<br>Interesuję się matematyką i inżynierią komputerową.<br>I use Arch BTW"
                ),
                Div(
                  properties: "flex justify-center",
                  children: [
                    BrandLink(
                      properties: "h-30 w-30 p-2 inline-block rounded-full border border-transparent text-gray-900 hover:text-gray-900 hover:border-gray-900 cursor-pointer transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-white",
                      brand: "facebook",
                      link: "https://www.facebook.com/profile.php?id=100018056777388"
                    ),
                    BrandLink(
                      properties: "h-30 w-30 p-2 inline-block rounded-full border border-transparent text-gray-900 hover:text-gray-900 hover:border-gray-900 cursor-pointer transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-white",
                      brand: "github",
                      link: "https://github.com/PiotrZPL/"
                    ),
                    BrandLink(
                      properties: "h-30 w-30 p-2 inline-block rounded-full border border-transparent text-gray-900 hover:text-gray-900 hover:border-gray-900 cursor-pointer transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-white",
                      brand: "reddit",
                      link: "https://www.reddit.com/user/Piotr_Lange"
                    )
                  ]
                )
              ]
            )
          ]
        ).toHtmlDoc(),
        BlogPage().toHtmlDoc(),
        ProjectsPage().toHtmlDoc(),
        PrimeCheckPage().toHtmlDoc()
      ] + renderMDPages()
    ),
    "tailwind.config.js"
  );
}