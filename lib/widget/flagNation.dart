import 'package:flutter/material.dart';

Image flagNation(String nameNegara, double ukuran) {
  if (nameNegara == "Germany" || nameNegara == "germany") {
    return Image.asset("assets/images/germany.png", width: ukuran);
  } else if (nameNegara == "Italy" || nameNegara == "Italian") {
    return Image.asset("assets/images/italy.png", width: ukuran);
  } else if (nameNegara == "Great Britain" || nameNegara == "British") {
    return Image.asset("assets/images/uk.png", width: ukuran);
  } else if (nameNegara == "Austria") {
    return Image.asset("assets/images/austria.png", width: ukuran);
  } else if (nameNegara == "Swiss" || nameNegara == "Switzerland") {
    return Image.asset("assets/images/swiss.png", width: ukuran);
  } else if (nameNegara == "United States") {
    return Image.asset("assets/images/usa.png", width: ukuran);
  } else if (nameNegara == "France" || nameNegara == "French") {
    return Image.asset("assets/images/france.png", width: ukuran);
  } else if (nameNegara == "Irish") {
    return Image.asset("assets/images/irleand.png", width: ukuran);
  }
  return Image.asset("assets/images/germany.png", width: ukuran);
}
