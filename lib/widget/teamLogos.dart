import 'package:flutter/material.dart';

Image teamLogos(String teamLogo, double ukuran) {
  switch (teamLogo) {
    case "McLaren Formula 1 Team":
      return Image.asset("assets/images/team/mclaren.png", width: ukuran);
    case "Scuderia Ferrari":
      return Image.asset("assets/images/team/ferrari.png", width: ukuran);
    case "Williams Racing":
      return Image.asset("assets/images/team/williams.png", width: ukuran);
    case "Sauber F1 Team":
      return Image.asset("assets/images/team/sauber.png", width: ukuran);
    case "Red Bull Racing":
      return Image.asset("assets/images/team/redbull.png", width: ukuran);
    case "Mercedes Formula 1 Team":
      return Image.asset("assets/images/team/merc.png", width: ukuran);
    case "Aston Martin F1 Team":
      return Image.asset("assets/images/team/aston.png", width: ukuran);
    case "Alpine F1 Team":
      return Image.asset("assets/images/team/alpine.png", width: ukuran);
    case "Haas F1 Team":
      return Image.asset("assets/images/team/haas.png", width: ukuran);
    case "RB F1 Team":
      return Image.asset("assets/images/team/rb.png", width: ukuran);
    case "Alfa Romeo":
      return Image.asset("assets/images/team/alfaromeo.png", width: ukuran);
    case "AlphaTauri":
      return Image.asset("assets/images/team/alpha.png", width: ukuran);
    case "Renault":
      return Image.asset("assets/images/team/renault.png", width: ukuran);
    case "Racing Point":
      return Image.asset("assets/images/team/racingpoint.png", width: ukuran);
    case "Toro Rosso":
      return Image.asset("assets/images/team/tororoso.png", width: ukuran);
    case "Force India":
      return Image.asset("assets/images/team/forceindia.png", width: ukuran);
    default:
      return Image.asset("assets/images/team/whitecricle.png", width: ukuran);
  }
}
