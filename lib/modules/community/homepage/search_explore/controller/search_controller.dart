import '../model/search_user_model.dart';

class SearchExploreController {

  List<SearchUserModel> allUsers = [

    SearchUserModel(
      image: "assets/images/rabbit.jpg",
      username: "Rabbitu.roll",
      subtitle: "Mr. cutiepie",
    ),

    SearchUserModel(
      image: "assets/images/rabbit2.jpg",
      username: "Rab...565",
      subtitle: "rabbit",
    ),

    SearchUserModel(
      image: "assets/images/carrot.jpg",
      username: "RABIT_Food",
      subtitle: "Food by us",
      verified: true,
    ),

    SearchUserModel(
      image: "assets/images/rabbit.jpg",
      username: "Ra_toys",
      subtitle: "🐰",
    ),

  ];

  List<SearchUserModel> results = [];

  void search(String query) {

    if(query.isEmpty){
      results.clear();
      return;
    }

    results = allUsers
        .where((user) =>
        user.username.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void removeItem(int index) {
    results.removeAt(index);
  }

  void clearAll() {
    results.clear();
  }

}