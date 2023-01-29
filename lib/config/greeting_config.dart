class GreetingConfig {
  String getGreeting() {
    if (DateTime.now().hour >= 6 && DateTime.now().hour <= 10) {
      return 'Selamat Pagi';
    } else if (DateTime.now().hour >= 10 && DateTime.now().hour <= 18) {
      return 'Selamat Siang';
    } else {
      return 'Selamat Malam';
    }
  }

  String get greeting => getGreeting();
}
