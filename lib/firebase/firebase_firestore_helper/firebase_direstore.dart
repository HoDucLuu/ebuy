import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebuy/constants/constants.dart';
import 'package:ebuy/models/category_models/categoty_model.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").get();

      List<CategoryModel> categoryList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();

      return categoryList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }
}
