import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}
class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/favorite': (context) => const FavoriteScreen(),
        '/shopping_bag': (context) => const ShoppingBagScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
// Главная форма "Каталог"
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
          actions: <Widget>[
            IconButton(tooltip: "Настройка",
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(Icons.settings)),
            TextButton(
                onPressed: () {},
                child: const Text('Профиль'),
                style: buttonStyle),
          ]
      ),

      drawer: navDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/images/folder-open.png'),),
            Text('Каталог'),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
            currentIndex = value;
            switch (value) {
              case 0:
                Navigator.pushNamed(context, '/');
                break;
              case 1:
                Navigator.pushNamed(context, '/favorite');
                break;
              case 2:
                Navigator.pushNamed(context, '/shopping_bag');
                break;
            }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Каталог",),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Избранное",),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Корзина",)
        ],
      ),
    );
  }
}
// Форма "Избранное"
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Избранное'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/images/heart.png'),),
            Text('Избранное'),
          ],
        ),
      ),
    );
  }
}
// Форма "Корзина"
class ShoppingBagScreen extends StatelessWidget {
  const ShoppingBagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Корзина'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/images/shopping-bag.png'),),
            Text('Корзина'),
          ],
        ),
      ),
    );
  }
}

// Форма "Настройка"
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройка'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/images/settings.png'),),
            Text('Настройка'),
          ],
        ),
      ),
    );
  }
}

Widget navDrawer(context) => Drawer(
  child: ListView(padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
          decoration: const BoxDecoration(color: Colors.blue,
          ),
          child: SizedBox(height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: 100,
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(50.0))),
                  child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/220px-Google-flutter-logo.svg.png"),
                ),
                const Text("Навигация во Flutter",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          )
      ),
      ListTile(leading: const Icon(Icons.folder), title: const Text('Каталог'),
        onTap: () {
        // _messengerKey.currentState!.showSnackBar(
        //     const SnackBar(content: Text('Переход в Каталог')));
          Navigator.pushNamed(context, '/');
        },
      ),
      ListTile(leading: const Icon(Icons.favorite), title: const Text('Избранное'),
        onTap: () {
        // _messengerKey.currentState!.showSnackBar(
        //     const SnackBar(content: Text('Переход в Избранное')));
          Navigator.pushNamed(context, '/favorite');
        },
      ),
      ListTile(leading: const Icon(Icons.shopping_bag), title: const Text('Корзина'),
        onTap: () {
        //_messengerKey.currentState!.showSnackBar(
        //    const SnackBar(content: Text('Переход в Корзину')));
          Navigator.pushNamed(context, '/shopping_bag');
        },
      ),
      const Divider(),
      const Padding(padding: EdgeInsets.only(left: 10),
        child: Text('Профиль'),),
      ListTile(leading: const Icon(Icons.settings), title: const Text('Настройка'),
        onTap: () {
        // _messengerKey.currentState!.showSnackBar
          //     const SnackBar(content: Text('Переход в Настройки')));
          Navigator.pushNamed(context, '/settings');
        },
      ),
    ],
  ),
);


