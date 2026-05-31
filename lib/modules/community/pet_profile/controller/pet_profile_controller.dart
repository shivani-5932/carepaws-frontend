import 'package:care_paws/modules/community/pet_profile/model/pet_profile_item_model.dart';



class PetProfileController {

  // List<PetProfileItemModel> posts = [];
  // List<PetProfileItemModel> clips = [];
  // List<PetProfileItemModel> mentions = [];


  List<PetProfileItemModel> posts = [
    PetProfileItemModel(image: "assets/images/dog1.png"),
    PetProfileItemModel(image: "assets/images/dog2.png"),
    PetProfileItemModel(image: "assets/images/dogs.png"),
  ];

  List<PetProfileItemModel> clips = [
    PetProfileItemModel(image: "assets/images/dog1.png", isVideo: true),
    PetProfileItemModel(image: "assets/images/dog2.png", isVideo: true),
  ];

  List<PetProfileItemModel> mentions = [
    PetProfileItemModel(image: "assets/images/dogs.png"),
    PetProfileItemModel(image: "assets/images/dog1.png"),
  ];

}