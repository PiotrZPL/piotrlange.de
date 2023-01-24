String translateWord(String engWord, String targetLanguage){
  if (targetLanguage == "en") {
    return engWord;
  }
  Map dictionary = {
    "Blog": {
      "pl": "Blog"
    },
    "Projects": {
      "pl": "Projekty"
    },
    "Contact me": {
      "pl": "Kontakt"
    }
  };
  if (dictionary.containsKey(engWord) && dictionary[engWord] is Map) {
    Map thistranslations = dictionary[engWord];
    if (thistranslations.containsKey(targetLanguage)) {
      return thistranslations[targetLanguage];
    }
    else{
      throw Exception("$targetLanguage translation not found for word $engWord");
    }
  }
  else {
    throw Exception("$engWord not found in the dictionary");
  }
}

String translateLink(String baseLink, String targetLanguage) {
  if (targetLanguage == "en") {
    return baseLink;
  }
  Map dictionary = {
    "/contact/": {
      "pl": "/pl/contact/"
    }
  };
  if (dictionary.containsKey(baseLink) && dictionary[baseLink] is Map) {
    Map thistranslations = dictionary[baseLink];
    if (thistranslations.containsKey(targetLanguage)) {
      return thistranslations[targetLanguage];
    }
    else{
      throw Exception("$targetLanguage translation not found for link $baseLink");
    }
  }
  else {
    throw Exception("$baseLink not found in the dictionary");
  }

}