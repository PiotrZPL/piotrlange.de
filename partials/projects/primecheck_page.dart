import 'package:dbml/dbml.dart';
import '../pageBase.dart';

class PrimeCheckPage extends PageBase {
  PrimeCheckPage() : super(
    path: "/projects/primecheck/index.html",
    title: "PrimeCheck - Piotr Lange",
    listOfWidgets: [
      Img(
        src: "/images/primecheck.webp"
      )
    ]
  );
}