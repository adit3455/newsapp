import 'package:firebase_auth/firebase_auth.dart';

class GreetingConfig {
  User? auth = FirebaseAuth.instance.currentUser;

  String _getGreeting() {
    if (DateTime.now().hour >= 6 && DateTime.now().hour <= 10) {
      return 'Selamat Pagi';
    } else if (DateTime.now().hour >= 10 && DateTime.now().hour <= 18) {
      return 'Selamat Siang';
    } else {
      return 'Selamat Malam';
    }
  }

  String? _getName() {
    if (auth?.displayName == null) {
      return auth?.email;
    } else if (auth?.isAnonymous == true) {
      return 'Anonymous';
    } else if (auth?.displayName != null) {
      return auth?.displayName;
    }
    return null;
  }

  getPhoto() {
    if (auth?.photoURL == null) {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png";
    }
    return auth!.photoURL;
  }

  String? _getNameDrawer() {
    if (auth?.isAnonymous == true) {
      return 'Anonymous';
    } else if (auth?.displayName == null) {
      return "Name isn't input yet";
    } else if (auth?.displayName != null) {
      return auth!.displayName;
    }
    return null;
  }

  String? get nameDrawer => _getNameDrawer();

  String? get name => _getName();

  String get greeting => _getGreeting();
}
