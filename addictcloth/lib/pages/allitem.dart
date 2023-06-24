import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detilproduk.dart';

class Product {
  final String name;
  final String price;
  final String image;
  final String description;

  Product(
      {required this.name,
      required this.price,
      required this.image,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['merek'],
      price: json['harga'],
      image: json['gambar'],
      description: json['deskripsi'],
    );
  }
}

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http
        .get(Uri.parse('https://websiteprojek.000webhostapp.com/api/produk'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Product> productList = [];

      for (var item in data) {
        Product product = Product.fromJson(item);
        productList.add(product);
      }

      setState(() {
        products = productList;
      });
    } else {
      print('Failed to fetch products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF300054),
        title: const Text('Product List'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final foto = products[index].image;
final fotourl = "https://websiteprojek.000webhostapp.com/frontend/assets/img/produk/$foto";

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailprodukWidget(
                    item: products[index],
                    imageUrl:
                        'https://websiteprojek.000webhostapp.com/frontend/assets/img/produk/$foto',
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      fotourl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rp ${products[index].price}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProductListWidget(),
  ));
}
