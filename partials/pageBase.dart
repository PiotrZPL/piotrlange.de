import 'package:staurolite/staurolite.dart';
import 'utilities/translations.dart';
import 'language_switcher.dart';

class PageBase {
  PageBase ({
    required this.path,
    required this.title,
    required this.listOfWidgets,
    this.description,
    this.language = "en"
  });

  String path;
  String title;
  String? description;
  List<HtmlWidget> listOfWidgets;
  String language;

  HtmlDoc toHtmlDoc() {
    return HtmlDoc(
      description: description,
      lang: language,
      path: path,
      head: Head(
        title: title,
        children: [
          Meta(
            charset: "UTF-8"
          ),
          Meta(
            name: "viewport",
            content: "width=device-width, initial-scale=1"
          ),
          Meta(
            name: "description",
            content: description
          ),
          Link(
            rel: "stylesheet",
            href: "/style/tailwind.css",
          ),
          Link(
            rel: "icon",
            sizes: "32x32",
            href: "/images/favicon-32x32.png"
          ),
          Link(
            rel: "icon",
            sizes: "16x16",
            href: "/images/favicon-16x16.png"
          ),
          Link(
            rel: "stylesheet",
            href: "/fonts/fa/css/fork-awesome.min.css",
          )
        ]
      ),
      body: Body(
        properties: "bg-gray-100 dark:bg-gray-800 dark:text-white relative flex flex-col min-h-screen",
        // Fixes mobileMenu size
        onresize: "onWindowResize();",
        children: [
          Script(
            script: """
    var darkStorage = localStorage.getItem('darkmode');
    var isBrowserDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;

    if (!darkStorage && isBrowserDark) {
      document.documentElement.classList.add('dark');
      localStorage.setItem('darkmode', 'dark')
    }
    if (darkStorage && darkStorage === 'dark') {
      document.documentElement.classList.add('dark')
    }"""
          ),
          Div(
            properties: "z-20 toggle-dark-mode fixed bottom-8 right-8 w-6 h-6 md:w-10 md:h-10 fill-current",
            children: [
              Div(
                properties: "hidden dark:block",
                children: [
                  IndicateText(
                    properties: "fa fa-3x fa-sun"
                  )
                ]
              ),
              Div(
                properties: "dark:hidden",
                children: [
                  IndicateText(
                    properties: "fa fa-3x fa-moon"
                  )
                ]
              )
            ]
          ),
          Header(
            properties: "container flex justify-between md:justify-between gap-4 flex-wrap px-6 pt-3 mx-auto relative",
            children: [
              Hyperlink(
                href: "/",
                properties: "capitalize font-extrabold text-2xl",
                text: "PIOTR LANGE"
              ),
              Button(
                ariaLabel: "Mobile menu button",
                properties: "block relative h-auto mobile-menu-button md:hidden",
                children: [
                  Div(
                    id: "line",
                    properties: "m-auto h-0.5 w-6 rounded dark:bg-gray-100 bg-gray-900 transition duration-300"
                  ),
                  Div(
                    id: "line2",
                    properties: "m-auto mt-2 h-0.5 w-6 rounded dark:bg-gray-100 bg-gray-900 transition duration-300"
                  ),
                  Div(
                    id: "line3",
                    properties: "m-auto mt-2 h-0.5 w-6 rounded dark:bg-gray-100 bg-gray-900 transition duration-300"
                  )
                ]
              ),
              UnorderedList(
                properties: "mobile-menu absolute z-100 h-0 md:h-auto overflow-hidden px-6 md:pb-6 md:p-0 top-full left-0 w-full md:w-auto md:relative md:flex md:flex-row flex-col items-center md:items-center gap-6 md:gap-6 bg-gray-100 dark:bg-gray-800 transition-all ease-in duration-300",
                children: [
                  ListItem(
                    properties: "grid place-items-center my-2 text-lg font-bold",
                    children: [
                      Hyperlink(
                        href: "/blog",
                        text: translateWord("Blog", language)
                      )
                    ]
                  ),
                  ListItem(
                    properties: "grid place-items-center my-2 text-lg font-bold",
                    children: [
                      Hyperlink(
                        href: "/projects",
                        text: translateWord("Projects", language)
                      )
                    ]
                  ),
                  ListItem(
                    properties: "grid place-items-center my-2 text-lg font-bold",
                    children: [
                      Hyperlink(
                        href: "https://nextcloud.piotrlange.de/",
                        text: "Nextcloud"
                      )
                    ]
                  ),
                  ListItem(
                    properties: "grid place-items-center my-2 text-lg font-bold",
                    children: [
                      Hyperlink(
                        href: translateLink("/contact/", language),
                        text: translateWord("Contact me", language)
                      )
                    ]
                  ),
                  ListItem(
                    properties: "grid place-items-center my-2 text-lg font-bold hidden md:block",
                    children: [
                      Span(
                        text: "|"
                      )
                    ]
                  ),
                  ListItem(
                    properties: "grid place-items-center my-2 text-lg font-bold",
                    children: [
                      LanguageSwitcher(languageList: ["pl"], currentLanguage: language)
                    ]
                  ),
                ]
              )
            ]
          ),
          Main(
            properties: "flex-1",
            children: listOfWidgets
          ),
          Footer(
            properties: "container p-6 mx-auto flex justify-center",
            children: [
              Paragraph(
                properties: "text-sm",
                text: """© 2020-${DateTime.now().year} - Piotr Lange - Powered by ${Hyperlink(href: "https://github.com/PiotrZPL/staurolite", text:"Staurolite", properties: "text-blue-500 font-bold").toHTML()}"""
              ),
            ]
          ),

          Script(
            script: """const mobileMenuButton = document.querySelector('.mobile-menu-button')
    const mobileMenu = document.querySelector('.mobile-menu')
    function toggleMenu() {
      mobileMenuButton.querySelector('#line').classList.toggle('rotate-45')
      mobileMenuButton.querySelector('#line').classList.toggle('translate-y-1.5')

      mobileMenuButton.querySelector('#line3').classList.toggle('-rotate-45')
      mobileMenuButton.querySelector('#line3').classList.toggle('-translate-y-1')

      mobileMenuButton.querySelector('#line2').classList.toggle('hidden')
      if (mobileMenu.clientHeight === 0) {
        mobileMenu.style.paddingTop = '20px'
        // navbar.style.paddingBottom = '20px'
        mobileMenu.style.height = `\${parseInt(mobileMenu.scrollHeight + 30)}px`
        return
        // console.log("1")
      }
      mobileMenu.style.height = '0px'
      mobileMenu.style.paddingTop = '0px'
    }
    if(mobileMenu && mobileMenuButton){
      mobileMenuButton.addEventListener('click', toggleMenu)
    }"""
          ),
          Script(
            script: """const darkmode = document.querySelector('.toggle-dark-mode');
    function toggleDarkMode() {
      if (document.documentElement.classList.contains('dark')) {
        mobileMenu.classList.toggle("duration-300")
        mobileMenu.classList.toggle("transition-all")
        document.documentElement.classList.remove('dark')
        localStorage.setItem('darkmode', 'light')
        // mobileMenu.classList.toggle("duration-300")
        // mobileMenu.classList.toggle("transition-all")
        setTimeout(() => {  mobileMenu.classList.toggle("duration-300"); mobileMenu.classList.toggle("transition-all"); }, 500);
      } else {
        mobileMenu.classList.toggle("duration-300")
        mobileMenu.classList.toggle("transition-all")
        document.documentElement.classList.add('dark')
        localStorage.setItem('darkmode', 'dark')
        // mobileMenu.classList.toggle("duration-300")
        // mobileMenu.classList.toggle("transition-all")
        setTimeout(() => {  mobileMenu.classList.toggle("duration-300"); mobileMenu.classList.toggle("transition-all"); }, 500);
      }
    }
    if (darkmode) {
      darkmode.addEventListener('click', toggleDarkMode);
    }

    //darkStorage = localStorage.getItem('darkmode');
    //isBrowserDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;

    //if (!darkStorage && isBrowserDark) {
    //  document.documentElement.classList.add('dark');
    //}

    //if (darkStorage && darkStorage === 'dark') {
    //  toggleDarkMode();
    //}
    """
          ),
          Script(
            script: """function onWindowResize() {
        mobileMenuButton.querySelector('#line').classList.remove('rotate-45')
        mobileMenuButton.querySelector('#line').classList.remove('translate-y-1.5')

        mobileMenuButton.querySelector('#line3').classList.remove('-rotate-45')
        mobileMenuButton.querySelector('#line3').classList.remove('-translate-y-1')

        mobileMenuButton.querySelector('#line2').classList.remove('hidden')
        mobileMenu.style.height = "";
        mobileMenu.style.paddingTop = "";
      }"""
          )
        ]
      )
    );
  }
}