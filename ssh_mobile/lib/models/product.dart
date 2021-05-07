class Product {
  final String pname, description, color, type, gender;
  final int pid, typeID;
  final double price;
  // final ByteBuffer image;
  final String image;

  Product({
    this.pid,
    this.price,
    this.color,
    this.description,
    this.pname,
    this.type,
    this.typeID,
    this.gender,
    this.image
  });
}

List<Product> products = [
  Product(
      pid: 1,
      pname: "Wand Vibrator",
      price: 112.01,
      description: "GG",
      image: "assets/images/Wand.png",
      color: "0xFFBD55F0"),
  Product(
      pid: 2,
      pname: "Clitoral Vibrator",
      price: 51.01,
      description: "GG",
      image: "assets/images/Wand2.png",
      color: "0xFFFCC6DF"),
  Product(
      pid: 3,
      pname: "Clit Suction Toys",
      price: 61.01,
      description: "GG",
      image: "assets/images/Clit_Suction.png",
      color: "0xFFDF69B9"),
  Product(
      pid: 4,
      pname: "Magic Toy",
      price: 122.01,
      description: "GG",
      image: "assets/images/Clitoral.png",
      color: "0xFFB388CA"),
];

List<Product> critoral = [
  Product(
      pid: 1,
      pname: "Clitoral Suction I",
      price: 130.01,
      description: "GG",
      image: "assets/images/ClitoralVi-1.png",
      color: "0xFFB74D7C"),
  Product(
      pid: 2,
      pname: "Clitoral Suction II",
      price: 150.01,
      description: "GG",
      image: "assets/images/ClitoralVi-2.png",
      color: "0xFFDCAAE5"),
  Product(
      pid: 3,
      pname: "Clitoral Toys",
      price: 99.01,
      description: "GG",
      image: "assets/images/ClitoralVi-3.png",
      color: "0xFFDCAAE5"),
  Product(
      pid: 4,
      pname: "Clitoral Toy MK2",
      price: 150.01,
      description: "GG",
      image: "assets/images/ClitoralVi-4.png",
      color: "0xFFFCC6DF"),
];

List<Product> clit = [
  Product(
      pid: 1,
      pname: "Clit Suction I",
      price: 95.01,
      description: "GG",
      image: "assets/images/SlitSuction-1.png",
      color: "0xFFDCAAE5"),
  Product(
      pid: 2,
      pname: "Clit Magic",
      price: 666.01,
      description: "GG",
      image: "assets/images/SlitSuction-2.png",
      color: "0xFFDBC5C0"),
  Product(
      pid: 3,
      pname: "Clit Suction MK2",
      price: 191.01,
      description: "GG",
      image: "assets/images/SlitSuction-3.png",
      color: "0xFFB8D7D5"),
  Product(
      pid: 4,
      pname: "Clit Suction MK3",
      price: 333.01,
      description: "GG",
      image: "assets/images/SlitSuction-4.png",
      color: "0xFFDCAAE5"),
];

List<Product> dildos = [
  Product(
      pid: 1,
      pname: "BBC",
      price: 500.01,
      description: "GG",
      image: "assets/images/Dildo-1.png",
      color: "0xFFFFFEE8"),
  Product(
      pid: 2,
      pname: "BBC MK1",
      price: 550.01,
      description: "GG",
      image: "assets/images/Dildo-2.png",
      color: "0xFF212424"),
  Product(
      pid: 3,
      pname: "Clit Suction Toys",
      price: 111.01,
      description: "GG",
      image: "assets/images/Dildo-3.png",
      color: "0xFFDCAAE5"),
  Product(
      pid: 4,
      pname: "Dildos",
      price: 111.01,
      description: "GG",
      image: "assets/images/Dildo-4.png",
      color: "0xFFE9C6DD"),
];
