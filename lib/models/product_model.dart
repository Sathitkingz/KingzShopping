class ProductModel {
  // Field
  String color, detail, name, imagePath, price;

  // Constructor
  ProductModel(this.color, this.detail, this.name, this.imagePath, this.price);

  ProductModel.fromFireStore(Map<String, dynamic> parseFireStore) {
    color = parseFireStore['Color'];
    detail = parseFireStore['Detail'];
    name = parseFireStore['Name'];
    imagePath = parseFireStore['ImagePath'];
    price = parseFireStore['Price'];
  }

  @override
  String toString() {
    // TODO: implement toString
    //return super.toString();

    return 'color=$color,detail=$detail,name=$name,imagePath=$imagePath,price=$price';
  }
}
