import 'package:flutter/material.dart';

Image flagNation(String nameNegara, double ukuran) {
  switch (nameNegara.toLowerCase()) {
    case "germany":
      return Image.asset("assets/images/nation/germany.png", width: ukuran);
    case "italy":
    case "italian":
      return Image.asset("assets/images/nation/italy.png", width: ukuran);
    case "great britain":
    case "british":
      return Image.asset("assets/images/nation/uk.png", width: ukuran);
    case "austria":
      return Image.asset("assets/images/nation/austria.png", width: ukuran);
    case "swiss":
    case "switzerland":
      return Image.asset("assets/images/nation/swiss.png", width: ukuran);
    case "united states":
      return Image.asset("assets/images/nation/usa.png", width: ukuran);
    case "france":
    case "french":
      return Image.asset("assets/images/nation/france.png", width: ukuran);
    case "irish":
      return Image.asset("assets/images/nation/irleand.png", width: ukuran);
    case "indian":
      return Image.asset("assets/images/nation/india.png", width: ukuran);
    default:
      return Image.asset("assets/images/nation/whitecricle.png", width: ukuran);
  }
}
