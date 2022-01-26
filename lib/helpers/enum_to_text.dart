import '../models/meal.dart';

class EnumToText {
  static String getComplexityText(COMPLEXITY complexity) {
    switch (complexity) {
      case COMPLEXITY.Challenging:
        return "Challenging";
      case COMPLEXITY.Hard:
        return "Hard";
      case COMPLEXITY.Simple:
        return "Simple";
      default:
        return "Unknown";
    }
  }

  static String getAffordabilityText(AFFORDABILITY affordability) {
    switch (affordability) {
      case AFFORDABILITY.Affordable:
        return "Affordable";
      case AFFORDABILITY.Luxurious:
        return "Luxurious";
      case AFFORDABILITY.Pricey:
        return "Pricey";
      default:
        return "Unknown";
    }
  }
}
