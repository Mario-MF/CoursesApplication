import 'dart:convert';

class LocalizationModel {
  final String search;
  final String enterSearch;
  final String cart;
  final String settings;
  final String teacher;
  final String viewAll;
  final String bestOf;
  final String english;
  final String arabic;
  final String darkMode;

  LocalizationModel(
      {this.search,
      this.enterSearch,
      this.cart,
      this.settings,
      this.teacher,
      this.viewAll,
      this.bestOf,
      this.english,
      this.arabic,this.darkMode});

  factory LocalizationModel.fromJson(data) {
    Map<String, dynamic> json = jsonDecode(data);
    return LocalizationModel(
      search: json['search'] as String,
      enterSearch: json['enterSearch'] as String,
      cart: json['cart'] as String,
      settings: json['settings'] as String,
      teacher: json['teacher'] as String,
      viewAll: json['viewAll'] as String,
      bestOf: json['bestOf'] as String,
      english: json['english'] as String,
      arabic: json['arabic'] as String,
      darkMode: json['darkMode'] as String,
    );
  }
}
