import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import 'home.dart';
import 'user_manager.dart';

enum PaymentMethod {
  COD,
  BRI,
  DANA,
}

class CheckoutPage extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;

  const CheckoutPage({
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    Key? key,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedSize = 'S';
  TextEditingController namaPembeliController = TextEditingController();
  TextEditingController noTelponPembeliController = TextEditingController();
  TextEditingController alamatPengirimanController = TextEditingController();
  PaymentMethod selectedPaymentMethod = PaymentMethod.COD;

  @override
  void initState() {
    super.initState();

    // Inisialisasi dan set nilai awal pada TextEditingController
    namaPembeliController = TextEditingController(text: UserManager().name);
    noTelponPembeliController =
        TextEditingController(text: UserManager().phone_number);
    alamatPengirimanController =
        TextEditingController(text: UserManager().address);
  }

  void cetakStruk() async {
    String namaPembeli = namaPembeliController.text;
    String noTelponPembeli = noTelponPembeliController.text;
    String alamatPengiriman = alamatPengirimanController.text;

    String paymentMethodText = '';

    switch (selectedPaymentMethod) {
      case PaymentMethod.COD:
        paymentMethodText = 'COD';
        break;
      case PaymentMethod.BRI:
        paymentMethodText = 'BRI (003301133967500)';
        break;
      case PaymentMethod.DANA:
        paymentMethodText = 'DANA: (085156023639)';
        break;
    }

    const phoneNumber = '+6288231328113';
    final message =
        'Halo admin, saya ingin pre-order produk dari Addictive Clothing nih\n'
        'berikut adalah struk pesanan saya: \n'
        'Nama Pembeli: $namaPembeli\n'
        'No. Telpon Pembeli: $noTelponPembeli\n'
        'Alamat Pengiriman: $alamatPengiriman\n'
        'Produk: ${widget.productName}\n'
        'Ukuran Produk: $selectedSize\n'
        'Harga Produk: ${widget.productPrice}\n'
        'Metode Pembayaran: $paymentMethodText\n';

    final url =
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

    // ignore: deprecated_member_use
    launcher.launch(url);
  }

  void showSuccessAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.check_circle, color: Colors.green, size: 40),
          content: const Text(
            'Pembelian sedang diproses. Mohon selesaikan transaksi dengan admin dan jangan lupa kirim bukti transfernya ya. Terimakasih!',
            textAlign: TextAlign.center,
          ),
          actions: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  cetakStruk();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(userData: {}),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF300054),
                ),
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF300054),
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Nama Pembeli',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: namaPembeliController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nama pembeli',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'No. Telpon Pembeli',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: noTelponPembeliController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan no. telpon pembeli',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Alamat Pengiriman',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: alamatPengirimanController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Masukkan alamat pengiriman',
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.imageUrl,
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        widget.productName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ukuran Produk',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: selectedSize,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSize = newValue!;
                  });
                },
                items: ['S', 'M', 'L', 'XL', 'XXL'].map((String size) {
                  return DropdownMenuItem<String>(
                    value: size,
                    child: Text(size),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Text(
                'Harga Produk',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(widget.productPrice),
              const SizedBox(height: 16),
              const Text(
                'Metode Pembayaran',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButton<PaymentMethod>(
                value: selectedPaymentMethod,
                onChanged: (PaymentMethod? newValue) {
                  setState(() {
                    selectedPaymentMethod = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem<PaymentMethod>(
                    value: PaymentMethod.COD,
                    child: Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 8),
                        Text('COD'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<PaymentMethod>(
                    value: PaymentMethod.BRI,
                    child: Row(
                      children: [
                        Icon(Icons.payment),
                        SizedBox(width: 8),
                        Text('BRI: 003301133967500'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<PaymentMethod>(
                    value: PaymentMethod.DANA,
                    child: Row(
                      children: [
                        Icon(Icons.payment),
                        SizedBox(width: 8),
                        Text('DANA: 085156023639'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  showSuccessAlert();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF300054),
                ),
                child: const Text('Lakukan Pembayaran Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
