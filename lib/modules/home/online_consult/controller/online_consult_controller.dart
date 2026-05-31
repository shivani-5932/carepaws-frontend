import 'package:care_paws/modules/home/online_consult/widget/filter/filter_model.dart';

class OnlineConsultController {

  String selectedType = "online";
  String selectedSort = "Relevance";

  FilterModel filterModel = FilterModel();

  void setSort(String value){
    selectedSort = value;
  }

  /// 🔥 TOGGLE FILTER
  void toggleFilter(String category, String value){
    final list = filterModel.selected[category]!;

    if(list.contains(value)){
      list.remove(value);
    } else {
      list.add(value);
    }
  }

  /// 🔥 CLEAR ALL
  void clearAllFilters(){
    filterModel.clearAll();
  }

  /// 🔥 DUMMY DATA
  List<Map<String, dynamic>> doctors = [

    {
      "image": "assets/images/doc1.png",
      "name": "Dr. Neha Prakash",
      "speciality": "General Vet",
      "exp": "10 years EXP",
      "lang": "Hindi | Punjabi | English",
      "distance": "110 km | Pathankot",
      "rating": "4.9",
      "price": "569",
      "available": true,
      "consultTime": "",
      "modes": "Call | Video Call | Chat ",
    },

    {
      "image": "assets/images/doc2.png",
      "name": "Dr. Karun Singh",
      "speciality": "General Vet",
      "exp": "8 years EXP",
      "lang": "Hindi | Punjabi",
      "distance": "95 km | Amritsar",
      "rating": "4.8",
      "price": "700",
      "available": false,
      "consultTime": "Consult in 20 mins",
      "modes": "Call | Chat | Visit",
    },

    {
      "image": "assets/images/doc1.png",
      "name": "Dr. Riya Sharma",
      "speciality": "Dermatology",
      "exp": "6 years EXP",
      "lang": "English | Hindi",
      "distance": "80 km | Ludhiana",
      "rating": "4.7",
      "price": "499",
      "available": true,
      "consultTime": "",
      "modes": "Video Call | Chat | Clinic",
    },

    {
      "image": "assets/images/doc2.png",
      "name": "Dr. Aman Verma",
      "speciality": "Surgery",
      "exp": "12 years EXP",
      "lang": "Hindi | English",
      "distance": "120 km | Jalandhar",
      "rating": "4.9",
      "price": "899",
      "available": false,
      "consultTime": "Consult in 15 mins",
      "modes": "Call | Video Call | Visit",
    },

    {
      "image": "assets/images/doc1.png",
      "name": "Dr. Simran Kaur",
      "speciality": "Nutritionist",
      "exp": "5 years EXP",
      "lang": "Punjabi | English",
      "distance": "60 km | Amritsar",
      "rating": "4.6",
      "price": "399",
      "available": true,
      "consultTime": "",
      "modes": "Chat | Video Call",
    },
  ];

  /// 🔥 TYPE FILTER (online / physical / both)
  List<Map<String, dynamic>> getFilteredDoctors(){

    return doctors.where((d){

      final modes = d["modes"].toString().toLowerCase();

      bool isOnline = modes.contains("call") ||
          modes.contains("video") ||
          modes.contains("chat");

      bool isPhysical = modes.contains("visit") ||
          modes.contains("clinic");

      if(selectedType == "online"){
        return isOnline;
      }

      if(selectedType == "physical"){
        return isPhysical;
      }

      if(selectedType == "both"){
        return isOnline && isPhysical;
      }

      return true;

    }).toList();
  }

  /// 🔥 SORTING
  List<Map<String, dynamic>> applySorting(List<Map<String, dynamic>> list){

    List<Map<String, dynamic>> sorted = List.from(list);

    switch(selectedSort){

      case "Price - Low to High":
        sorted.sort((a,b) =>
            int.parse(a["price"]).compareTo(int.parse(b["price"])));
        break;

      case "Price - High to Low":
        sorted.sort((a,b) =>
            int.parse(b["price"]).compareTo(int.parse(a["price"])));
        break;

      case "Rating":
        sorted.sort((a,b) =>
            double.parse(b["rating"]).compareTo(double.parse(a["rating"])));
        break;

      case "Years of Experience":
        sorted.sort((a,b){
          int expA = int.parse(a["exp"].split(" ")[0]);
          int expB = int.parse(b["exp"].split(" ")[0]);
          return expB.compareTo(expA);
        });
        break;

      case "Availability":
        sorted.sort((a,b){
          return (b["available"] ? 1 : 0)
              .compareTo(a["available"] ? 1 : 0);
        });
        break;

      default:
        break;
    }

    return sorted;
  }

  List<Map<String, dynamic>> applyFilters(List<Map<String, dynamic>> list){

    final f = filterModel.selected;

    return list.where((d){

      /// EXPERIENCE
      if(f["Experience"]!.isNotEmpty){
        int exp = int.parse(d["exp"].split(" ")[0]);

        bool match = f["Experience"]!.any((range){

          if(range == "0-5") return exp <= 5;
          if(range == "5-6") return exp >= 5 && exp <= 6;
          if(range == "6-11") return exp >= 6 && exp <= 11;
          if(range == "11-16") return exp >= 11 && exp <= 16;
          if(range == "16+") return exp >= 16;

          return false;
        });

        if(!match) return false;
      }

      /// PRICE
      if(f["Price"]!.isNotEmpty){
        int price = int.parse(d["price"]);

        bool match = f["Price"]!.any((range){

          if(range == "100-500") return price >= 100 && price <= 500;
          if(range == "500-1000") return price >= 500 && price <= 1000;
          if(range == "1000+") return price >= 1000;

          return false;
        });

        if(!match) return false;
      }

      /// LANGUAGE
      if(f["Language"]!.isNotEmpty){
        String lang = d["lang"].toString();

        bool match = f["Language"]!.any((l) => lang.contains(l));

        if(!match) return false;
      }

      /// FACILITY (modes)
      if(f["Facility"]!.isNotEmpty){
        String modes = d["modes"].toString();

        bool match = f["Facility"]!.any((m) => modes.contains(m));

        if(!match) return false;
      }

      /// SPECIALITY
      if(f["Speciality"]!.isNotEmpty){
        String spec = d["speciality"].toString();

        bool match = f["Speciality"]!.any((s) => spec.contains(s));

        if(!match) return false;
      }

      return true;

    }).toList();
  }
}