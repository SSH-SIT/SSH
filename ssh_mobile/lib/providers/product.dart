class Product {
  final String pname, description, color, type, gender;
  final int pid, typeID;
  final double price;
  // final ByteBuffer image;
  final String image;

  Product(
      {this.pid,
      this.price,
      this.color,
      this.description,
      this.pname,
      this.type,
      this.typeID,
      this.gender,
      this.image});
}
