import 'package:staurolite/staurolite.dart';
import '../pageBase.dart';

class PrimeCheckPage extends PageBase {
  PrimeCheckPage() : super(
    path: "/projects/primecheck/index.html",
    title: "PrimeCheck - Piotr Lange",
    listOfWidgets: [
      Image(
        src: "/images/primecheck.webp"
      )
    ]
  );
}