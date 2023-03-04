const Map<String, String> tableHeaders = {
  "date": "Dia",
  "weather": "Tempo",
  "cmax": "Máx.",
  "cmin": "Min.",
  "uvi": "IUV"
};

String weatherUviEmoji(double uvi) {
  if (uvi < 2) {
    return "🟢";
  } else if (uvi < 5) {
    return "🟡";
  } else if (uvi < 7) {
    return "🟠";
  } else if (uvi < 10) {
    return "🟣";
  } else {
    return "🔴";
  }
}

const Map<String, String> weatherEmojis = {
  "ec": "☁️ 🌧️",
  "ci": "🌦️",
  "c": "🌧️",
  "in": "🌧️ ⛅",
  "pp": "🌧 ️⛈️",
  "cm": "🌧️ 🌅",
  "cn": "🌧️🌙",
  "pt": "⛈️ 🌇",
  "pm": "⛈️ 🌅",
  "np": "☁ ⛈️",
  "pc": "⛈️",
  "pn": "⛅",
  "cv": "🌦️",
  "ch": "🌧️ 🌧️",
  "t": "⛈️ ⛈️",
  "ps": "🌤️",
  "e": "☁️ ☁️",
  "n": "⛅ ⛅",
  "cl": "⛅ ☀",
  "nv": "🌫️",
  "g": "❄️",
  "ne": "❄️ ❄️",
  "nd": "❓ ❓",
  "pnt": "⛈🌙",
  "psc": "🌧️",
  "pcm": "🌧️ 🌅",
  "pct": "🌧️ 🌇",
  "pcn": "🌧️ 🌙",
  "npt": "☁️ ⛈",
  "npn": "☁️ ⛈",
  "ncn": "☁️ 🌧️",
  "nct": "☁️ 🌧️",
  "ncm": "☁️ 🌧️",
  "npm": "☁️ ⛈",
  "npp": "☁️ 🌧️",
  "vn": "☁️ 🌫️",
  "ct": "🌧️ 🌇",
  "ppn": "⛈ 🌙",
  "ppt": "⛈ 🌇",
  "ppm": "⛈ 🌅"
};

// REFERÊNCIA DAS SIGLAS:
// http://servicos.cptec.inpe.br/XML/#condicoes-tempo