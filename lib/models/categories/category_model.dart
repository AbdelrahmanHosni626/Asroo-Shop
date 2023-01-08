class CategoryModel {
  String? electronics;
  String? jewelery;
  String? mensClothing;
  String? womensClothing;

  CategoryModel(
      this.electronics, this.jewelery, this.mensClothing, this.womensClothing);

  CategoryModel.fromJson(Map<String, dynamic> json)
  {
    electronics = json['electronics'];
    jewelery = json['jewelery'];
    mensClothing = json['men\'s clothing'];
    womensClothing = json['women\'s clothing'];
  }
}