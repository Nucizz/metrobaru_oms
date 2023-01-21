class Feature {
  static String getGreetingByTime() {
    var dt = DateTime.now();
    if (dt.hour < 11) {
      return "Good morning";
    } else if (dt.hour < 18) {
      return "Good afternoon";
    } else {
      return "Good evening";
    }
  }
}
