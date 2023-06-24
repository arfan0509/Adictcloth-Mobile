import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'allitem.dart';
import 'userprofile.dart';
import 'user_manager.dart';

class Home extends StatefulWidget {
  final Map<String, dynamic> userData;

  const Home({Key? key, required this.userData}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  String Id = UserManager().id;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color(0xFF300054),
            pinned: true,
            expandedHeight: 50.0,
            automaticallyImplyLeading: false, // Menghilangkan tombol back
            flexibleSpace: FlexibleSpaceBar(
              background: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 130,
                    height: 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'assets/images/logoo.jpg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            'Addictive\nClothing',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfilePage(
                            userId: '$Id',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 155,
                            child: Image.asset(
                              'assets/images/banner.png',
                              width: 100,
                              height: 162,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                            child: SizedBox(
                              width: double.infinity,
                              height: 191,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/aboutimg.png',
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(
                                    width: 190,
                                    height: 136,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 10),
                                          child: Text(
                                            'About Us',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          child: Text(
                                            'Addictive Clothing Store, sebuah toko baju distro dari Kota Kediri yang buka sejak 2021.\nUsaha ini diciptakan oleh 3 orang remaja asal kediri\nTidak hanya menjual baju distro tapi juga melayani sablon dan pembuatan jersey.',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5, 20, 5, 20),
                            child: SizedBox(
                              width: double.infinity,
                              height: 196,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Service',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      'Disini kami melayani',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 9,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Image.asset(
                                                  'assets/images/rou1.png',
                                                  width: 45,
                                                  height: 45,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const Text(
                                                'Kaos Distro',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  'Pilih kaos distro yang kamu inginkan dan pesan sekarang juga',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 8.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Image.asset(
                                                  'assets/images/rou2.png',
                                                  width: 45,
                                                  height: 45,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const Text(
                                                'Pembuatan Jersey',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  'Mau buat jersey untuk futsal? bulu tangkis? atau untuk e-sport tim kalian? boleeh',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 8.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Image.asset(
                                                  'assets/images/rou3.png',
                                                  width: 45,
                                                  height: 45,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const Text(
                                                'Sablon',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  'Disini kalian juga bisa request sablon, diantaranya sablon DTF, DTG dan Plastisol',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 8.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 275,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Categories',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Cari yang kamu inginkan',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 9,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Image.asset(
                                    'assets/images/banner2.png',
                                    width: double.infinity,
                                    height: 225,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: 350,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 15),
                                  child: Text(
                                    'Produk Kami',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 300,
                                  child: PageView(
                                    controller: _pageController,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProductListWidget(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                              child: SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image.asset(
                                                  'assets/images/baju1.jpg', // Replace with your image path
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              'T Shirt Addict Clothing V.3',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const Text(
                                              'Rp 135.000',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProductListWidget(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                              child: SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image.asset(
                                                  'assets/images/baju2.jpg',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              'T-shirt Streetwear - Astronot Desain',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const Text(
                                              'Rp 90.000',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProductListWidget(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                              child: SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image.asset(
                                                  'assets/images/baju3.jpg',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              'T-shirt streetwear - Kitsune Myth',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const Text(
                                              'Rp 135.000',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProductListWidget(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                              child: SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Image.asset(
                                                  'assets/images/baju4.jpg',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              'T-Shirt HYPE ASTRO - Addict Clothing',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const Text(
                                              'Rp 95.000',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            height: 35, // Tinggi tombol
                            padding: const EdgeInsets.symmetric(horizontal: 55),
                            child: ElevatedButton(
                              onPressed: () {
                                String whatsappUrl =
                                    "https://api.whatsapp.com/send?phone=6288231328113&text=Hai%20Admin%20Addict%20Clothing%2C%0A%0ASaya%20punya%20permintaan%20spesial%20nih%20buat%20Sablon%2FJersey%20yang%20mau%20saya%20pesan.%20%0ASaya%20siap%20buat%20menyediakan%20gambarnya%20dan%20mendiskusikan%20lebih%20detail%20soal%20desain%20yang%20saya%20mau%20buat.%0A%0ATerima%20kasih%20atas%20perhatian%20dan%20bantuannya.";
                                // ignore: deprecated_member_use
                                launch(whatsappUrl);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color(0xFF300054),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 3,
                              ),
                              child: const Text(
                                'Klik Disini Untuk Jasa Sablon & Jersey',
                                textAlign: TextAlign
                                    .center, // Mengatur penempatan teks ke tengah
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 260,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/size.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 315,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/footer.png',
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 25, 0, 0),
                                        child: Text(
                                          'Quotes For Life',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 140,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 10, 0),
                                                  child: SizedBox(
                                                    width: 300,
                                                    height: 135,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.asset(
                                                        'assets/images/quote1.png',
                                                        width: 300,
                                                        height: 200,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 10, 0),
                                                  child: SizedBox(
                                                    width: 300,
                                                    height: 135,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.asset(
                                                        'assets/images/quote2.png',
                                                        width: 300,
                                                        height: 200,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 10, 0),
                                                  child: SizedBox(
                                                    width: 300,
                                                    height: 135,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.asset(
                                                        'assets/images/quote3.png',
                                                        width: 300,
                                                        height: 200,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 115,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF390D5D),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 15, 0),
                                        child: SizedBox(
                                          width: 200,
                                          height: 100,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Addictive Clothing',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const Text(
                                                'Official Merchandise',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 200,
                                                height: 50,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 0, 0),
                                                      child: IconButton(
                                                        icon: Image.asset(
                                                          'assets/images/icon2.png',
                                                          width: 18,
                                                          height: 18,
                                                        ),
                                                        onPressed: () {
                                                          String instagramUrl =
                                                              'https://www.instagram.com/addictive_co/';
                                                          // ignore: deprecated_member_use
                                                          launch(instagramUrl);
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 0, 0),
                                                      child: IconButton(
                                                        icon: Image.asset(
                                                          'assets/images/icon1.png',
                                                          width: 18,
                                                          height: 18,
                                                        ),
                                                        onPressed: () {
                                                          String whatsappUrl =
                                                              "https://api.whatsapp.com/send?phone=6288231328113";
                                                          // ignore: deprecated_member_use
                                                          launch(whatsappUrl);
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 0, 0),
                                                      child: IconButton(
                                                        icon: Image.asset(
                                                          'assets/images/icon3.png',
                                                          width: 18,
                                                          height: 18,
                                                        ),
                                                        onPressed: () {
                                                          String url =
                                                              'https://tokopedia.link/addictclothting';
                                                          // ignore: deprecated_member_use
                                                          launch(url);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: const BoxDecoration(),
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Alamat',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 8, 10, 0),
                                              child: Text(
                                                'Jln.Tosaren 1, Kelurahan Tosaren, Kecamatan Pesantren RT02/RW01, Kota Kediri',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          color: const Color(0xFF390D5D),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/garis.png',
                                width: 300,
                                height: 10,
                                fit: BoxFit.fitWidth,
                              ),
                              const Text(
                                '© Addictive Clothing Official Merchandise. All Rights Reserved',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]))))
        ],
      ),
    );
  }
}
