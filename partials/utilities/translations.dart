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