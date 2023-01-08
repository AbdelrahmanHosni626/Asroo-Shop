import 'package:firebase_auth/firebase_auth.dart';

String validationEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

String validationName = r'^[a-z A-Z]+$';

void logout() {
  FirebaseAuth.instance.signOut();
}

dynamic uId = '';

String arabic = 'Arabic 🇸🇦󠁧󠁢󠁥󠁮󠁧󠁿';
String english = 'English 🇬🇧󠁧󠁢󠁥󠁮󠁧󠁿';
String france = 'France 🇫🇷󠁧󠁢󠁥󠁮󠁧󠁿';

String ar = 'ar';
String en = 'en';
String fr = 'fr';