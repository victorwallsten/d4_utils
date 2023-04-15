abstract class EnumUtils {
  static String enumToNameWithSpaces(Enum e) => e.name
      .replaceAllMapped(RegExp(r'[A-Z][a-z]*'), (match) => ' ${match[0]}')
      .substring(1);
}
