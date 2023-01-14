import 'package:dbml/dbml.dart';
import 'package:dart_emoji/dart_emoji.dart';

import 'brandLink.dart';

class PageBase {
  PageBase ({
    required this.path,
    required this.title,
    required this.listOfWidgets,
    this.description
  });

  String path;
  String title;
  String? description;
  List<HtmlWidget> listOfWidgets;

  HtmlDoc toHtmlDoc() {
    return HtmlDoc(
      description: description,
      lang: "en",
      path: path,
      head: Head(
        title: title,
        widgets: [
          Meta(
            charset: "UTF-8"
          ),
          Meta(
            name: "viewport",
            content: "width=device-width, initial-scale=1"
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
          )
        ]
      ),
      body: Body(
        widget_class: "bg-gray-100 dark:bg-gray-800 dark:text-white relative flex flex-col min-h-screen",
        // Fixes mobileMenu size
        onresize: "onWindowResize();",
        widgets: [
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
            widget_class: "z-20 toggle-dark-mode fixed bottom-5 right-5 w-6 h-6 md:w-10 md:h-10 fill-current",
            widgets: [
              Hyperlink(
                widget_class: "hidden dark:block",
                text: """<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Free 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. --><path d="M361.5 1.2c5 2.1 8.6 6.6 9.6 11.9L391 121l107.9 19.8c5.3 1 9.8 4.6 11.9 9.6s1.5 10.7-1.6 15.2L446.9 256l62.3 90.3c3.1 4.5 3.7 10.2 1.6 15.2s-6.6 8.6-11.9 9.6L391 391 371.1 498.9c-1 5.3-4.6 9.8-9.6 11.9s-10.7 1.5-15.2-1.6L256 446.9l-90.3 62.3c-4.5 3.1-10.2 3.7-15.2 1.6s-8.6-6.6-9.6-11.9L121 391 13.1 371.1c-5.3-1-9.8-4.6-11.9-9.6s-1.5-10.7 1.6-15.2L65.1 256 2.8 165.7c-3.1-4.5-3.7-10.2-1.6-15.2s6.6-8.6 11.9-9.6L121 121 140.9 13.1c1-5.3 4.6-9.8 9.6-11.9s10.7-1.5 15.2 1.6L256 65.1 346.3 2.8c4.5-3.1 10.2-3.7 15.2-1.6zM352 256c0 53-43 96-96 96s-96-43-96-96s43-96 96-96s96 43 96 96zm32 0c0-70.7-57.3-128-128-128s-128 57.3-128 128s57.3 128 128 128s128-57.3 128-128z"/></svg>"""
              ),
              Hyperlink(
                widget_class: "dark:hidden",
                text: """<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Free 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. --><path d="M223.5 32C100 32 0 132.3 0 256S100 480 223.5 480c60.6 0 115.5-24.2 155.8-63.4c5-4.9 6.3-12.5 3.1-18.7s-10.1-9.7-17-8.5c-9.8 1.7-19.8 2.6-30.1 2.6c-96.9 0-175.5-78.8-175.5-176c0-65.8 36-123.1 89.3-153.3c6.1-3.5 9.2-10.5 7.7-17.3s-7.3-11.9-14.3-12.5c-6.3-.5-12.6-.8-19-.8z"/></svg>"""
              )
            ]
          ),
          Header(
            widget_class: "container flex justify-between md:justify-between gap-4 flex-wrap px-6 pt-3 mx-auto relative",
            widgets: [
              Hyperlink(
                href: "/",
                widget_class: "capitalize font-extrabold text-2xl",
                text: "PIOTR LANGE"
              ),
              Button(
                widget_class: "block relative h-auto mobile-menu-button md:hidden",
                widgets: [
                  Div(
                    id: "line",
                    widget_class: "m-auto h-0.5 w-6 rounded dark:bg-gray-100 bg-gray-900 transition duration-300"
                  ),
                  Div(
                    id: "line2",
                    widget_class: "m-auto mt-2 h-0.5 w-6 rounded dark:bg-gray-100 bg-gray-900 transition duration-300"
                  ),
                  Div(
                    id: "line3",
                    widget_class: "m-auto mt-2 h-0.5 w-6 rounded dark:bg-gray-100 bg-gray-900 transition duration-300"
                  )
                ]
              ),
              UnorderedList(
                widget_class: "mobile-menu absolute z-100 h-0 md:h-auto overflow-hidden px-6 md:pb-6 md:p-0 top-full left-0 w-full md:w-auto md:relative md:flex md:flex-row flex-col items-center md:items-center gap-6 md:gap-6 bg-gray-100 dark:bg-gray-800 transition-all ease-in duration-300",
                widgets: [
                  ListItem(
                    widget_class: "grid place-items-center my-2 text-lg font-bold",
                    widgets: [
                      Hyperlink(
                        href: "/blog",
                        text: "Blog"
                      )
                    ]
                  ),
                  ListItem(
                    widget_class: "grid place-items-center my-2 text-lg font-bold",
                    widgets: [
                      Hyperlink(
                        href: "/projects",
                        text: "Projects"
                      )
                    ]
                  ),
                  ListItem(
                    widget_class: "grid place-items-center my-2 text-lg font-bold",
                    widgets: [
                      Hyperlink(
                        href: "https://nextcloud.piotrlange.de/",
                        text: "Nextcloud"
                      )
                    ]
                  ),
                  ListItem(
                    widget_class: "grid place-items-center my-2 text-lg font-bold",
                    widgets: [
                      Hyperlink(
                        href: "/contact",
                        text: "Contact me"
                      )
                    ]
                  ),
                  ListItem(
                    widget_class: "grid place-items-center my-2 text-lg font-bold hidden md:block",
                    widgets: [
                      Span(
                        text: "|"
                      )
                    ]
                  ),
                  ListItem(
                    widget_class: "grid place-items-center my-2 text-lg font-bold",
                    widgets: [
                      Hyperlink(
                        href: "/pl/",
                        text: EmojiParser().emojify(":flag-pl:")
                      )
                    ]
                  ),
          //         ListItem(
          //           widget_class: "grid place-items-center my-2",
          //           widgets: [
          //             Span(
          //               widget_class: "toggle-dark-mode inline-block cursor-pointer",
          //               text: """<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5"
          //   stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
          //   <path stroke="none" d="M0 0h24v24H0z" fill="none" />
          //   <circle cx="12" cy="12" r="3" />
          //   <line x1="12" y1="5" x2="12" y2="5.01" />
          //   <line x1="17" y1="7" x2="17" y2="7.01" />
          //   <line x1="19" y1="12" x2="19" y2="12.01" />
          //   <line x1="17" y1="17" x2="17" y2="17.01" />
          //   <line x1="12" y1="19" x2="12" y2="19.01" />
          //   <line x1="7" y1="17" x2="7" y2="17.01" />
          //   <line x1="5" y1="12" x2="5" y2="12.01" />
          //   <line x1="7" y1="7" x2="7" y2="7.01" />
          // </svg>"""
          //             )
          //           ]
          //         )
                ]
              )
            ]
          ),
          Main(
            widget_class: "flex-1",
            widgets: listOfWidgets
          ),
          Footer(
            widget_class: "container p-6 mx-auto flex justify-center",
            widgets: [
              Paragraph(
                widget_class: "text-sm",
                text: """© 2020-${DateTime.now().year} - Piotr Lange - Powered by ${Hyperlink(href: "https://github.com/PiotrZPL/dbml", text:"DBML", widget_class: "text-blue-500 font-bold").toHTML()}"""
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