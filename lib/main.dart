
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sayyid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Beranda(),
    );
  }
}

// HALAMAN UTAMA
class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int selectedIndex = 0;

  final List<String> menuHalaman = [
    'Home',
    'Business',
    'School',
  ];

  final List<IconData> ikonHalaman = [
    Icons.home,
    Icons.business,
    Icons.school,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // HEADER
      appBar: const HeaderBar(),

      // SIDEBAR KIRI
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 28,
                    child: Icon(
                      Icons.person,
                      size: 32,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menu Bar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: selectedIndex == 0,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Business'),
              selected: selectedIndex == 1,
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('School'),
              selected: selectedIndex == 2,
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // KONTEN UTAMA
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              ikonHalaman[selectedIndex],
              size: 60,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            Text(
              selectedIndex == 0
                  ? 'Coba coba aja dulu yakan!'
                  : 'Halaman ${menuHalaman[selectedIndex]}',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 99, 25, 25),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      // NAVIGASI BAWAH
      bottomNavigationBar: IconBar(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

// HEADER TERPISAH
class HeaderBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HeaderBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // IKON SIDEBAR KIRI
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Buka menu',
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),

      // JUDUL TENGAH
      title: const Text(
        '',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 99, 25, 25),
        ),
      ),
      centerTitle: true,

      // DROPDOWN PROFIL KANAN
      actions: [
        PopupMenuButton<String>(
          tooltip: 'Menu profil',
          icon: const Icon(
            Icons.account_circle,
            size: 30,
          ),
          onSelected: (value) {
            switch (value) {
              case 'profil':
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menu Profil dipilih'),
                  ),
                );
                break;

              case 'pengaturan':
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menu Pengaturan dipilih'),
                  ),
                );
                break;

              case 'logout':
                showDialog<void>(
                  context: context,
                  builder: (dialogContext) {
                    return AlertDialog(
                      title: const Text('Logout'),
                      content: const Text(
                        'Apakah kamu yakin ingin logout?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(dialogContext);
                          },
                          child: const Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(dialogContext);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Logout belum terhubung ke autentikasi',
                                ),
                              ),
                            );
                          },
                          child: const Text('Ya, Logout'),
                        ),
                      ],
                    );
                  },
                );
                break;
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: 'profil',
              child: Row(
                children: [
                  Icon(Icons.person_outline),
                  SizedBox(width: 10),
                  Text('Profil'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'pengaturan',
              child: Row(
                children: [
                  Icon(Icons.settings_outlined),
                  SizedBox(width: 10),
                  Text('Pengaturan'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'logout',
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 10),
                  Text('Logout'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

// BOTTOM NAVIGATION TERPISAH
class IconBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const IconBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
    );
  }
}
