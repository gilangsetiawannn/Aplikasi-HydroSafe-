
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  TextEditingController _searchController = TextEditingController();
  String? _username;
  bool hasNewNotification = true; // Ini bisa diubah sesuai status notifikasi

  final List<Map<String, String>> _infoList = [
    {
      'title': 'Tips Hemat Air di Rumah',
      'content':
          'Hemat air merupakan langkah penting dalam menjaga keberlanjutan sumber daya. Anda bisa mulai dengan langkah sederhana...',
      'fullContent': 'Hemat air merupakan langkah penting dalam menjaga keberlanjutan sumber daya. Anda bisa mulai dengan langkah sederhana di rumah dapat mengurangi penggunaan air yang signifikan. Mematikan keran saat tidak digunakan, memperbaiki kebocoran sesegera mungkin, dan memilih peralatan rumah tangga hemat air seperti mesin cuci berlabel efisien adalah contoh awal. Untuk di kamar mandi, gunakan shower dengan aliran rendah, yang dapat mengurangi penggunaan air hingga 40%. Di dapur, cucilah sayur dan buah dalam wadah alih-alih di bawah air mengalir. Gunakan air bekas mencuci sayuran untuk menyiram tanaman. Mengurangi durasi mandi hanya dua menit dapat menghemat hingga 10 liter air per sesi mandi. Untuk kebutuhan di luar rumah, gunakan ember saat mencuci kendaraan daripada selang, karena selang yang mengalir bisa menghabiskan hingga 500 liter air dalam 30 menit. Bersikap bijaksana dalam mengelola air tidak hanya menghemat biaya, tetapi juga melindungi ekosistem dan menjamin pasokan air yang lebih berkelanjutan.',
      'image': 'assets/tips.png',
    },
    {
      'title': 'Krisis Air Global',
      'content':
          'Krisis air merupakan tantangan yang dihadapi oleh banyak negara...',
      'fullContent': 'Krisis air merupakan tantangan yang dihadapi oleh banyak negarayang kini merasakan dampak langsung, terutama daerah-daerah kering atau yang kekurangan infrastruktur yang memadai. Diperkirakan lebih dari dua miliar orang hidup di wilayah yang memiliki keterbatasan air setidaknya selama sebulan setiap tahunnya. Faktor-faktor seperti perubahan iklim, pertumbuhan populasi, serta pencemaran sumber air memperparah masalah ini. Krisis air bukan hanya tentang ketersediaan, tapi juga kualitas air. Limbah industri, bahan kimia beracun, dan polusi plastik mengurangi kualitas sumber air yang ada, membuat air semakin sulit didapatkan. Untuk mengatasi krisis ini, solusi berkelanjutan seperti daur ulang air, inovasi dalam pengolahan air, dan konservasi air dalam skala rumah tangga sangat diperlukan. Pendidikan dan kesadaran masyarakat akan pentingnya konservasi air menjadi kunci dalam menghadapi krisis air ini.',
      'image': 'assets/krisis.png',
    },
    {
      'title': 'Teknologi dan Inovasi dalam Pengolahan Air',
      'content':
          'Teknologi baru terus dikembangkan untuk memudahkan pengolahan dan distribusi air bersih...',
      'fullContent': 'Teknologi baru terus dikembangkan untuk memudahkan pengolahan dan distribusi air bersih yang semakin meningkat. Desalinasi, misalnya, adalah proses yang mengubah air laut menjadi air layak minum, dan teknologi ini menjadi solusi di banyak negara yang minim sumber air tawar. Selain itu, teknologi membran dalam penyaringan air limbah memungkinkan daur ulang air menjadi lebih efisien. Dalam bidang distribusi, Internet of Things (IoT) telah membantu menciptakan jaringan pipa pintar yang mendeteksi kebocoran dan mengatur aliran air secara otomatis. Di masa depan, teknologi seperti pemurnian air berbasis energi surya atau pengolahan air dengan metode biologis diharapkan akan menjadi solusi yang lebih murah dan ramah lingkungan. Inovasi teknologi dalam bidang air berpotensi tidak hanya memberikan akses air bersih bagi semua orang tetapi juga menjaga keberlanjutan lingkungan untuk generasi mendatang.',
      'image': 'assets/Teknologi.png',
    },
    {
      'title': 'Dampak Lingkungan dan Air',
      'content':
          'Perubahan iklim berdampak besar pada siklus air di bumi. Banjir, kekeringan, dan pola hujan...',
      'fullContent':  'Perubahan iklim berdampak besar pada siklus air di bumi. Banjir, kekeringan, dan pola hujan yang tidak menentu adalah beberapa konsekuensi dari perubahan iklim yang memengaruhi ketersediaan air. Pemanasan global mempercepat penguapan dan mengubah distribusi hujan, sehingga beberapa wilayah kekurangan air sementara lainnya terkena banjir. Di sisi lain, polusi dari limbah industri, pertanian, dan rumah tangga mencemari sumber air. Plastik mikro, bahan kimia berbahaya, dan pupuk yang merembes ke sungai dan danau merusak kualitas air dan membahayakan kehidupan akuatik. Selain itu, perubahan suhu menyebabkan pencairan es di kutub, menaikkan permukaan laut yang berpotensi menenggelamkan wilayah pesisir. Untuk mengurangi dampak ini, diperlukan langkah-langkah konkret dalam pengurangan emisi gas rumah kaca, pengelolaan limbah yang tepat, dan restorasi lingkungan yang dapat menjaga ekosistem air tetap sehat.',
      'image': 'assets/Dampak.png',
    },
    {
      'title': 'SDGs dan Air: Langkah untuk Keberlanjutan',
      'content':
          'Sustainable Development Goal (SDG) 6 berfokus pada memastikan ketersediaan dan pengelolaan air bersih...',
      'fullContent':  'Sustainable Development Goal (SDG) 6 berfokus pada memastikan ketersediaan dan pengelolaan air bersih yang berkelanjutan untuk semua. Target ini mencakup akses universal terhadap air minum aman, sanitasi, serta mengurangi pencemaran dan efisiensi penggunaan air di seluruh dunia. Lebih dari dua miliar orang masih kekurangan akses ke layanan air yang dikelola dengan aman, dan angka ini terus bertambah seiring dengan tantangan perubahan iklim dan pertumbuhan penduduk. SDG 6 juga menekankan pentingnya melindungi dan memulihkan ekosistem yang berkaitan dengan air seperti hutan, sungai, dan danau. Dengan melibatkan partisipasi masyarakat dalam menjaga sumber daya air dan membangun infrastruktur yang ramah lingkungan, tujuan ini bisa tercapai pada tahun 2030. Semua pihak, mulai dari pemerintah hingga individu, harus aktif mengambil bagian dalam mewujudkan air bersih yang berkelanjutan.',
      'image': 'assets/SGDs.png',
    },
    {
      'title': 'Kondisi Kualitas Air di Balikpapan',
      'content':
          'Di Balikpapan, kualitas air menghadapi sejumlah tantangan, khususnya di area yang padat penduduk...',
      'fullContent':'Di Balikpapan, kualitas air menghadapi sejumlah tantangan, khususnya di area yang padat penduduk dan pesisir. Sumber air utama di Balikpapan sebagian besar dipengaruhi oleh aktivitas industri dan limbah domestik. Selain itu, kualitas air semakin memburuk akibat sedimentasi dan penggunaan bahan kimia di wilayah pertanian yang merembes ke aliran air. Pencemaran dari industri migas yang menjadi penggerak ekonomi lokal turut memperburuk kondisi ini. Meski pemerintah telah berupaya mengatasi masalah ini dengan meningkatkan sistem pengelolaan air limbah, partisipasi masyarakat sangat penting untuk menjaga kebersihan sumber air. Balikpapan telah menjalankan beberapa program edukasi dan pemberdayaan masyarakat untuk mempromosikan pentingnya air bersih dan kesehatan lingkungan. Dengan langkah bersama, Balikpapan diharapkan mampu menjaga kualitas air agar tetap layak untuk generasi mendatang.',
      'image': 'assets/kualitas.png',
    },
  ];
  List<Map<String, String>> _filteredInfoList = [];

  @override
  void initState() {
    super.initState();
    _filteredInfoList = _infoList;
    _searchController.addListener(_filterInfoList);
  }

  void _filterInfoList() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredInfoList = _infoList.where((info) =>
          info['title']!.toLowerCase().contains(query) ||
          info['content']!.toLowerCase().contains(query)).toList();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    setState(() {
      _username = args?['name'] ?? 'Hydrofans';
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home', arguments: {'name': _username});
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/order');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/payment');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/order-history');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile', arguments: {'name': _username});
        break;
    }
  }

  // Fungsi untuk membuka halaman chat dengan admin
  void _openChatWithAdmin() {
    Navigator.pushNamed(context, '/chat');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 77, 137, 185),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hi, $_username',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Cari informasi...',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Stack(
                      children: [
                        Icon(Icons.notifications),
                        if (hasNewNotification)
                          Positioned(
                            right: 0,
                            child: Icon(
                              Icons.circle,
                              color: const Color.fromARGB(255, 0, 100, 231),
                              size: 8,
                            ),
                          ),
                      ],
                    ),
                    onPressed: _openChatWithAdmin,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredInfoList.length,
                itemBuilder: (context, index) {
                  return _buildInfoBox(
                    title: _filteredInfoList[index]['title']!,
                    content: _filteredInfoList[index]['content']!,
                    image: _filteredInfoList[index]['image']!,
                    fullContent: _filteredInfoList[index]['fullContent']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 123, 159, 221),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color.fromARGB(255, 59, 117, 211),
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Order History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildInfoBox({
    required String title,
    required String content,
    required String image,
    required String fullContent,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              _getTrimmedContent(content),
              style: TextStyle(fontSize: 14),
            ),
            TextButton(
              onPressed: () => _showFullContent(fullContent),
              child: Text("Baca Selengkapnya"),
            ),
          ],
        ),
      ),
    );
  }

  String _getTrimmedContent(String content) {
    return content.length > 100 ? content.substring(0, 100) + '...' : content;
  }

  void _showFullContent(String fullContent) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InfoDetailScreen(fullContent: fullContent),
      ),
    );
  }
}

class InfoDetailScreen extends StatelessWidget {
  final String fullContent;

  InfoDetailScreen({required this.fullContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Informasi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            fullContent,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

