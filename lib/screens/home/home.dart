//trang Home

import 'package:ebuy/constants/theme.dart';
import 'package:ebuy/firebase/firebase_firestore_helper/firebase_direstore.dart';
import 'package:ebuy/models/category_models/categoty_model.dart';
import 'package:ebuy/models/product_models/product_model.dart';
import 'package:ebuy/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TopTitles(title: "E-Buy", subtitle: ""),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Search..."),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        const Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categoriesList
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Card(
                                color: Colors.white,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(e.image),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12.0, left: 12.0),
                    child: Text(
                      "Top Selling",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),

                  //hien thi danh sach
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      primary: false, //khong cho keo truot
                      itemCount: bestProduct.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.9,
                              crossAxisCount: 2),
                      itemBuilder: (ctx, index) {
                        ProductModel singleProduct = bestProduct[index];
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12.0,
                              ),
                              Image.network(
                                singleProduct.image,
                                width: 120,
                                height: 120,
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                singleProduct.name,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Price: \$${singleProduct.price}"),
                              const SizedBox(
                                height: 12.0,
                              ),
                              SizedBox(
                                height: 45,
                                width: 140,
                                child: OutlinedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Buy",
                                      style: TextStyle(color: Colors.red),
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

// // danh sach anh
// List<String> categoriesList = [
//   //"https://static.vecteezy.com/system/resources/previ…00/964/198/original/fast-food-meal-set-vector.jpg",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg2cdsM_73DvxbgTmtallbuQSZNeFF6rX9Pw&usqp=CAU",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLvj6NqYGBn3mnRxBI0pO3alV7gLry_KWAQw&usqp=CAU",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV9p_LY2vGpbMa0IiWuGnwtj3FFjNS1po-Lg&usqp=CAU",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfuK55dwtZJE0_ob8rwtGHUn4KQ5M1xBO5Rw&usqp=CAU",
// ];

//model product
List<ProductModel> bestProduct = [
  ProductModel(
    id: "1",
    name: "Banana",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg2cdsM_73DvxbgTmtallbuQSZNeFF6rX9Pw&usqp=CAU",
    price: "1",
    description: "This is good Banana for health you can eat it",
    status: "pending",
    isFarourite: false,
  ),
  ProductModel(
    id: "2",
    name: "Apple",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLvj6NqYGBn3mnRxBI0pO3alV7gLry_KWAQw&usqp=CAU",
    price: "1",
    description: "This is good Banana for health you can eat it",
    status: "pending",
    isFarourite: false,
  ),
  ProductModel(
    id: "3",
    name: "Manago",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV9p_LY2vGpbMa0IiWuGnwtj3FFjNS1po-Lg&usqp=CAU",
    price: "1",
    description: "This is good Banana for health you can eat it",
    status: "pending",
    isFarourite: false,
  ),
  ProductModel(
    id: "4",
    name: "WateMelon",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2Lkh3e7SSdJ4Fr1fg8hmDRKi8eIeXnavVg5sN1fQmcHpeD-c3sL4A58P9hbsybhWunjU&usqp=CAU",
    price: "1",
    description: "This is good Banana for health you can eat it",
    status: "pending",
    isFarourite: false,
  ),
];
