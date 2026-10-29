import 'package:flutter/material.dart';

void main() {
  runApp(const NavigasiApp());
}

const Color ungu = Color(0xFF7650D8);
const Color latar = Color(0xFFF7F5FC);

class NavigasiApp extends StatelessWidget {
  const NavigasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SosialKu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ungu),
        scaffoldBackgroundColor: latar,
        useMaterial3: true,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int halamanAktif = 0;
  final List<String> judul = ['Beranda', 'Search', 'Reels', 'Shop', 'Profil'];

  void bukaHalaman(int index) {
    setState(() => halamanAktif = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'SosialKu',
          style: TextStyle(fontWeight: FontWeight.bold, color: ungu),
        ),
        actions: [
          IconButton(
            tooltip: 'Stories',
            onPressed: () => _pesan(context, 'Fitur Stories dipilih'),
            icon: const Icon(Icons.add_circle_outline),
          ),
          IconButton(
            tooltip: 'Notifikasi',
            onPressed: () => _pesan(context, 'Belum ada notifikasi baru'),
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 6),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: ungu),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 32, color: ungu),
                    ),
                    SizedBox(height: 10),
                    Text('Menu Samping', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                    Text('Kelola akun SosialKu', style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
              ListTile(leading: const Icon(Icons.settings), title: const Text('Pengaturan'), onTap: () => _bukaMenu(context, 'Pengaturan')),
              ListTile(leading: const Icon(Icons.history), title: const Text('Aktivitas'), onTap: () => _bukaMenu(context, 'Aktivitas')),
              ListTile(leading: const Icon(Icons.archive_outlined), title: const Text('Arsip'), onTap: () => _bukaMenu(context, 'Arsip')),
              const Divider(),
              ListTile(leading: const Icon(Icons.logout), title: const Text('Keluar'), onTap: () => _bukaMenu(context, 'Keluar')),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFFE9E1FF)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.mark_email_unread_outlined, size: 38, color: ungu),
                    SizedBox(height: 8),
                    Text('Pesan', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text('Lihat pesan dan permintaan'),
                  ],
                ),
              ),
              ListTile(leading: const Icon(Icons.mail_outline), title: const Text('Pesan Masuk'), onTap: () => _bukaMenu(context, 'Pesan Masuk')),
              ListTile(leading: const Icon(Icons.mail_lock_outlined), title: const Text('Permintaan'), onTap: () => _bukaMenu(context, 'Permintaan')),
              ListTile(leading: const Icon(Icons.settings), title: const Text('Pengaturan'), onTap: () => _bukaMenu(context, 'Pengaturan Pesan')),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: halamanAktif,
        children: const [
          BerandaPage(),
          SearchPage(),
          ReelsPage(),
          ShopPage(),
          ProfilPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: halamanAktif,
        onDestinationSelected: bukaHalaman,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Beranda'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.video_collection_outlined), selectedIcon: Icon(Icons.video_collection), label: 'Reels'),
          NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), selectedIcon: Icon(Icons.shopping_bag), label: 'Shop'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Stories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SizedBox(
          height: 86,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              StoryItem(nama: 'Cerita Anda', warna: Color(0xFFBCA8FF), tambah: true),
              StoryItem(nama: 'Nadia', warna: Color(0xFFFFC6D5)),
              StoryItem(nama: 'Raka', warna: Color(0xFFAEDFD0)),
              StoryItem(nama: 'Dina', warna: Color(0xFFFFD99A)),
              StoryItem(nama: 'Bima', warna: Color(0xFFAED0FF)),
            ],
          ),
        ),
        const SizedBox(height: 18),
        PostCard(nama: 'nadia.daily', caption: 'Menikmati hari dengan hal-hal sederhana ✨', warna: const Color(0xFFFFD9E3), ikon: Icons.local_florist),
        const SizedBox(height: 16),
        PostCard(nama: 'raka.photo', caption: 'Sedikit cerita dari perjalanan kemarin.', warna: const Color(0xFFC9DFFF), ikon: Icons.landscape),
      ],
    );
  }
}

class StoryItem extends StatelessWidget {
  final String nama;
  final Color warna;
  final bool tambah;

  const StoryItem({super.key, required this.nama, required this.warna, this.tambah = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ungu, width: 2)),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: warna,
              child: Icon(tambah ? Icons.add : Icons.person, color: Colors.white, size: 28),
            ),
          ),
          const SizedBox(height: 5),
          Text(nama, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final String nama;
  final String caption;
  final Color warna;
  final IconData ikon;

  const PostCard({super.key, required this.nama, required this.caption, required this.warna, required this.ikon});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool suka = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(backgroundColor: Color(0xFFE9E1FF), child: Icon(Icons.person, color: ungu)),
            title: Text(widget.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.more_horiz),
          ),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPostPage(nama: widget.nama, caption: widget.caption, warna: widget.warna, ikon: widget.ikon))),
            child: Container(
              height: 190,
              width: double.infinity,
              color: widget.warna,
              child: Icon(widget.ikon, size: 90, color: Colors.white.withValues(alpha: 0.9)),
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () => setState(() => suka = !suka), icon: Icon(suka ? Icons.favorite : Icons.favorite_border, color: suka ? Colors.red : null)),
              IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPostPage(nama: widget.nama, caption: widget.caption, warna: widget.warna, ikon: widget.ikon))), icon: const Icon(Icons.mode_comment_outlined)),
              IconButton(onPressed: () => _pesan(context, 'Postingan berhasil dibagikan (demo)'), icon: const Icon(Icons.share_outlined)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
            child: Text(widget.caption),
          ),
        ],
      ),
    );
  }
}

class DetailPostPage extends StatelessWidget {
  final String nama;
  final String caption;
  final Color warna;
  final IconData ikon;

  const DetailPostPage({super.key, required this.nama, required this.caption, required this.warna, required this.ikon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Post')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(nama, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Container(height: 240, decoration: BoxDecoration(color: warna, borderRadius: BorderRadius.circular(16)), child: Icon(ikon, size: 100, color: Colors.white)),
          const SizedBox(height: 12),
          Text(caption),
          const SizedBox(height: 18),
          const Text('Komentar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text('dina_k'), subtitle: Text('Bagus banget!')),
          const ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text('bima.id'), subtitle: Text('Terima kasih sudah berbagi.')),
          const SizedBox(height: 12),
          FilledButton.icon(onPressed: () => _pesan(context, 'Like diberikan (demo)'), icon: const Icon(Icons.favorite_border), label: const Text('Likes')),
          OutlinedButton.icon(onPressed: () => _pesan(context, 'Postingan dibagikan (demo)'), icon: const Icon(Icons.share), label: const Text('Share')),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Cari teman atau postingan',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Jelajahi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 12),
        const Wrap(spacing: 10, runSpacing: 10, children: [
          ExploreTile(icon: Icons.nature, color: Color(0xFFB6DCC8)),
          ExploreTile(icon: Icons.coffee, color: Color(0xFFE8C5A6)),
          ExploreTile(icon: Icons.music_note, color: Color(0xFFCDBEFF)),
          ExploreTile(icon: Icons.pets, color: Color(0xFFFFD5DF)),
        ]),
      ],
    );
  }
}

class ExploreTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  const ExploreTile({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(width: 145, height: 145, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)), child: Icon(icon, size: 48, color: Colors.white));
  }
}

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: 420,
        decoration: BoxDecoration(color: const Color(0xFFD8CCFF), borderRadius: BorderRadius.circular(24)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_circle_outline, size: 90, color: ungu),
            SizedBox(height: 12),
            Text('Reels', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Contoh halaman video pendek'),
          ],
        ),
      ),
    );
  }
}

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('Shop', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const ProductTile(nama: 'Tote Bag', harga: 'Rp35.000', ikon: Icons.shopping_bag, warna: Color(0xFFFFDDB5)),
        const ProductTile(nama: 'Botol Minum', harga: 'Rp25.000', ikon: Icons.water_drop, warna: Color(0xFFBFE5FF)),
        const ProductTile(nama: 'Notebook', harga: 'Rp18.000', ikon: Icons.menu_book, warna: Color(0xFFD8CCFF)),
      ],
    );
  }
}

class ProductTile extends StatelessWidget {
  final String nama;
  final String harga;
  final IconData ikon;
  final Color warna;
  const ProductTile({super.key, required this.nama, required this.harga, required this.ikon, required this.warna});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(backgroundColor: warna, child: Icon(ikon, color: ungu)),
        title: Text(nama),
        subtitle: Text(harga),
        trailing: IconButton(onPressed: () => _pesan(context, '$nama ditambahkan ke keranjang (demo)'), icon: const Icon(Icons.add_shopping_cart)),
      ),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Row(
          children: [
            CircleAvatar(radius: 42, backgroundColor: Color(0xFFD8CCFF), child: Icon(Icons.person, size: 48, color: ungu)),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('isal.dev', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Statistik(jumlah: '12', label: 'Postingan'),
                    Statistik(jumlah: '340', label: 'Pengikut'),
                    Statistik(jumlah: '180', label: 'Mengikuti'),
                  ]),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Isal | Mahasiswa Informatika', style: TextStyle(fontWeight: FontWeight.bold)),
        const Text('Belajar, berbagi, dan bertumbuh bersama.'),
        const SizedBox(height: 14),
        OutlinedButton(onPressed: () => _pesan(context, 'Edit profil (demo)'), child: const Text('Edit Profil')),
        const SizedBox(height: 18),
        const Text('Postingan Saya', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(child: KotakProfil(warna: Color(0xFFFFD9E3), ikon: Icons.local_florist)),
            SizedBox(width: 8),
            Expanded(child: KotakProfil(warna: Color(0xFFC9DFFF), ikon: Icons.landscape)),
            SizedBox(width: 8),
            Expanded(child: KotakProfil(warna: Color(0xFFD8CCFF), ikon: Icons.music_note)),
          ],
        ),
      ],
    );
  }
}

class Statistik extends StatelessWidget {
  final String jumlah;
  final String label;
  const Statistik({super.key, required this.jumlah, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(jumlah, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)), Text(label, style: const TextStyle(fontSize: 10))]);
  }
}

class KotakProfil extends StatelessWidget {
  final Color warna;
  final IconData ikon;
  const KotakProfil({super.key, required this.warna, required this.ikon});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1, child: Container(decoration: BoxDecoration(color: warna, borderRadius: BorderRadius.circular(10)), child: Icon(ikon, size: 34, color: Colors.white)));
  }
}

void _bukaMenu(BuildContext context, String nama) {
  Navigator.pop(context);
  _pesan(context, '$nama dipilih (demo)');
}

void _pesan(BuildContext context, String pesan) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan), duration: const Duration(seconds: 2)));
}
