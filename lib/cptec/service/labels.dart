const Map<String, String> tableHeaders = {
  "date": "Dia",
  "weather": "Tempo",
  "cmax": "MΓ‘x.",
  "cmin": "Min.",
  "uvi": "IUV"
};

String weatherUviEmoji(double uvi) {
  if (uvi < 2) {
    return "π’";
  } else if (uvi < 5) {
    return "π‘";
  } else if (uvi < 7) {
    return "π ";
  } else if (uvi < 10) {
    return "π£";
  } else {
    return "π΄";
  }
}

const Map<String, String> weatherEmojis = {
  "ec": "βοΈ π§οΈ",
  "ci": "π¦οΈ",
  "c": "π§οΈ",
  "in": "π§οΈ β",
  "pp": "π§ οΈβοΈ",
  "cm": "π§οΈ π",
  "cn": "π§οΈπ",
  "pt": "βοΈ π",
  "pm": "βοΈ π",
  "np": "β βοΈ",
  "pc": "βοΈ",
  "pn": "β",
  "cv": "π¦οΈ",
  "ch": "π§οΈ π§οΈ",
  "t": "βοΈ βοΈ",
  "ps": "π€οΈ",
  "e": "βοΈ βοΈ",
  "n": "β β",
  "cl": "β β",
  "nv": "π«οΈ",
  "g": "βοΈ",
  "ne": "βοΈ βοΈ",
  "nd": "β β",
  "pnt": "βπ",
  "psc": "π§οΈ",
  "pcm": "π§οΈ π",
  "pct": "π§οΈ π",
  "pcn": "π§οΈ π",
  "npt": "βοΈ β",
  "npn": "βοΈ β",
  "ncn": "βοΈ π§οΈ",
  "nct": "βοΈ π§οΈ",
  "ncm": "βοΈ π§οΈ",
  "npm": "βοΈ β",
  "npp": "βοΈ π§οΈ",
  "vn": "βοΈ π«οΈ",
  "ct": "π§οΈ π",
  "ppn": "β π",
  "ppt": "β π",
  "ppm": "β π"
};

// REFERΓNCIA DAS SIGLAS:
// http://servicos.cptec.inpe.br/XML/#condicoes-tempo