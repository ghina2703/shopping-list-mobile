import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/left_drawer.dart';
import 'package:shopping_list/screens/shoplist_form.dart';
import 'package:shopping_list/widgets/shop_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // Callback function for "Tambah Produk" button tap
  void navigateToShopFormPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopFormPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'PBP Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(
                    item,
                    onItemTap: () {
                      if (item.name == "Tambah Produk") {
                        navigateToShopFormPage(context);
                      }
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ... ShopItem and items definitions


// class ShopItem {
//   final String name;
//   final IconData icon;

//   ShopItem(this.name, this.icon);
// }

// final List<ShopItem> items = [
//   ShopItem("Lihat Produk", Icons.checklist),
//   ShopItem("Tambah Produk", Icons.add_shopping_cart),
//   ShopItem("Logout", Icons.logout),
// ];

// class ShopCard extends StatelessWidget {
//   final ShopItem item;

//   const ShopCard(this.item, {Key? key}) : super(key: key); // Constructor

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.indigo,
//       child: InkWell(
//         // Area responsive terhadap sentuhan
//         onTap: () {
//           // Memunculkan SnackBar ketika diklik
//           ScaffoldMessenger.of(context)
//             ..hideCurrentSnackBar()
//             ..showSnackBar(SnackBar(
//                 content: Text("Kamu telah menekan tombol ${item.name}!")));
//         },
//         child: Container(
//           // Container untuk menyimpan Icon dan Text
//           padding: const EdgeInsets.all(8),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   item.icon,
//                   color: Colors.white,
//                   size: 30.0,
//                 ),
//                 const Padding(padding: EdgeInsets.all(3)),
//                 Text(
//                   item.name,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ShopCard extends StatelessWidget {
//   final ShopItem item;
//   final Function()? onItemTap; // Tambahkan parameter onItemTap

//   ShopCard(this.item, {Key? key, this.onItemTap}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.indigo,
//       child: InkWell(
//         onTap: () {
//           ScaffoldMessenger.of(context)
//             ..hideCurrentSnackBar()
//             ..showSnackBar(SnackBar(
//                 content: Text("Kamu telah menekan tombol ${item.name}!")));
//           if (onItemTap != null) {
//             onItemTap!(); // Panggil onItemTap jika tersedia
//           }
//         },
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   item.icon,
//                   color: Colors.white,
//                   size: 30.0,
//                 ),
//                 const Padding(padding: EdgeInsets.all(3)),
//                 Text(
//                   item.name,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
