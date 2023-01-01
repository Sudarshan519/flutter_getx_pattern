import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
        },
        'de_DE': {
          'hello': 'Hallo Welt',
        }
      };

}
 