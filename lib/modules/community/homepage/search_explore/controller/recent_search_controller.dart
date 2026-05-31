import '../model/recent_search_model.dart';

class ExploreSearchController {

  List<RecentSearchModel> recentSearches = [];

  void addSearch(RecentSearchModel user) {

    recentSearches.removeWhere(
            (element) => element.username == user.username);

    recentSearches.insert(0, user);

  }

  void removeSearch(int index) {
    recentSearches.removeAt(index);
  }

  void clearAll() {
    recentSearches.clear();
  }

}