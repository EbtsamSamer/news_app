class CategoryModel {
  String? id;
  String? name;
  String? image;

  CategoryModel({this.id, this.name, this.image});

  static List<CategoryModel> getCategory() {
    return [
      CategoryModel(
        image: "assets/images/gen.png",
        id: "general",
        name: "General",
      ),
      CategoryModel(
        image: "assets/images/bus.png",
        id: "business",
        name: "Business",
      ),
      CategoryModel(
        image: "assets/images/sport.png",
        id: "sports",
        name: "Sports",
      ),
      CategoryModel(
        image: "assets/images/health.png",
        id: "health",
        name: "Health",
      ),
      CategoryModel(
        image: "assets/images/science.png",
        id: "science",
        name: "Science",
      ),
      CategoryModel(
        image: "assets/images/tech.png",
        id: "technology",
        name: "Technology",
      ),

      CategoryModel(
        image: "assets/images/enter.png",
        id: "entertainment",
        name: "Entertainment",
      ),
    ];
  }
}
