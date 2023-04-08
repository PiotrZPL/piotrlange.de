import 'package:staurolite/staurolite.dart';
import 'partials/page_base.dart';
import 'partials/markdown_pages.dart';
import 'partials/blog_page.dart';
import 'partials/projects_page.dart';

void main() async {
  buildWebsite(
    Website(
      listOfHtml: [
        PageBase(
          path: "/index.html",
          title: "Piotr Lange",
          description: "Piotr Lange's personal website",
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
                    Hyperlink(
                      ariaLabel: "My Facebook profile",
                      href: "https://www.facebook.com/profile.php?id=100018056777388",
                      children: [
                        IndicateText(
                          properties: "fa fa-3x fa-facebook-official text-gray-900 hover:text-blue-500 transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-blue-500 ease-in duration-300 px-2"
                        )
                      ]
                    ),
                    Hyperlink(
                      ariaLabel: "My GitHub profile",
                      href: "https://github.com/PiotrZPL/",
                      children: [
                        IndicateText(
                          properties: "fa fa-3x fa-github text-gray-900 hover:text-green-500 transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-green-500 ease-in duration-300 px-2"
                        )
                      ]
                    ),
                    Hyperlink(
                      ariaLabel: "My reddit profile",
                      href: "https://www.reddit.com/user/Piotr_Lange",
                      children: [
                        IndicateText(
                          properties: "fa fa-3x fa-reddit text-gray-900 hover:text-red-500 transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-red-500 ease-in duration-300 px-2"
                        )
                      ]
                    ),
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
          description: "Strona personalna Piotra Lange",
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
                    Hyperlink(
                      ariaLabel: "My Facebook profile",
                      href: "https://www.facebook.com/profile.php?id=100018056777388",
                      children: [
                        IndicateText(
                          properties: "fa fa-3x fa-facebook-official text-gray-900 hover:text-blue-500 transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-blue-500 ease-in duration-300 px-2"
                        )
                      ]
                    ),
                    Hyperlink(
                      ariaLabel: "My GitHub profile",
                      href: "https://github.com/PiotrZPL/",
                      children: [
                        IndicateText(
                          properties: "fa fa-3x fa-github text-gray-900 hover:text-green-500 transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-green-500 ease-in duration-300 px-2"
                        )
                      ]
                    ),
                    Hyperlink(
                      ariaLabel: "My reddit profile",
                      href: "https://www.reddit.com/user/Piotr_Lange",
                      children: [
                        IndicateText(
                          properties: "fa fa-3x fa-reddit text-gray-900 hover:text-red-500 transition-colors dark:text-gray-200 dark:hover:border-gray-300 dark:hover:text-red-500 ease-in duration-300 px-2"
                        )
                      ]
                    ),
                  ]
                )
              ]
            )
          ]
        ).toHtmlDoc(),
        BlogPage().toHtmlDoc(),
        ProjectsPage().toHtmlDoc(),
      ] + renderMDPages()
    ),
    "tailwind.config.js"
  );
}