extension StringExtension on String? {

  String get orEmpty => this ?? "";

}