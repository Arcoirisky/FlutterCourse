// API key c7268574ec714445b444b00b135918b2

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  List<Article> headlinesCategory = [];
  final String _baseUrl = 'newsapi.org';
  final String _apiKey = 'c7268574ec714445b444b00b135918b2';
  final String _country = 'jp';

  String _selectedCategory = 'business';
  String get selectedCategory => _selectedCategory;

  int _topHeadlinePage = 0;
  int _headlineByCategoryPage = 0;

  List<CategoryModel> categories = [
    CategoryModel(name: 'business', icon: FontAwesomeIcons.building),
    CategoryModel(name: 'entertainment', icon: FontAwesomeIcons.tv),
    CategoryModel(name: 'general', icon: FontAwesomeIcons.addressCard),
    CategoryModel(name: 'health', icon: FontAwesomeIcons.headSideVirus),
    CategoryModel(name: 'science', icon: FontAwesomeIcons.vials),
    CategoryModel(name: 'sports', icon: FontAwesomeIcons.volleyball),
    CategoryModel(name: 'technology', icon: FontAwesomeIcons.memory),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    for (var element in categories) {
      categoryArticles[element.name] = [];
    }
    getHeadlinesByCategory();
  }

  get selectedCategoryArticles => categoryArticles[_selectedCategory];

  set selectedCategory(String value) {
    _selectedCategory = value;
    _headlineByCategoryPage = 0;
    getHeadlinesByCategory();
    notifyListeners();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1, category]) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'country': _country,
      'apiKey': _apiKey,
      'page': '$page',
      'category': _selectedCategory,
    });
    final resp = await http.get(url);
    return resp.body;
  }

  Future getHeadlinesByCategory() async {
    if (categoryArticles[_selectedCategory]!.isNotEmpty) return;

    final resp = await _getJsonData(
        'v2/top-headlines', _headlineByCategoryPage, _selectedCategory);
    final newsResponse = NewsResponse.fromJson(resp);
    categoryArticles[_selectedCategory]!.addAll(newsResponse.articles);
    notifyListeners();
  }

  Future getTopHeadlines() async {
    _topHeadlinePage++;
    final resp =
        await _getJsonData('v2/top-headlines', _topHeadlinePage, 'general');
    final newsResponse = NewsResponse.fromJson(resp);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
