import 'package:commerce/api/apiResponse.dart';
import 'package:commerce/component/Button.dart';
import 'package:commerce/component/component.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/screen/Home/component/productCard.dart';
import 'package:flutter/material.dart';
import 'package:commerce/screen/Search/searchScreen.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:commerce/models/product.dart';

import 'dart:async';
class searchField extends StatefulWidget {
  const searchField({Key? key}) : super(key: key);

  @override
  _searchFieldState createState() => _searchFieldState();
}

class _searchFieldState extends State<searchField> {
  List<Product>products =[];
  List<newProduct>Products=[];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
      VoidCallback callback, {
        Duration duration = const Duration(milliseconds: 1000),
      }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future  init() async {
    final products=await ProductApi.GetProductbyName(query);
    final List<newProduct> productslist= convertList(products);
    print(productslist.length);
    if(mounted)setState(() => this.Products = productslist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Search"),
      //   centerTitle: true,
      //   backgroundColor: Colors.redAccent,
      // ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
           buildSearch(),
            Expanded(
              // child: ListView.builder(
              //   itemCount: Products.length,
              //   itemBuilder: (context, index) {
              //     final Product = Products[index];
              //
              //     return buildproduct(Product);
              //   },
              // ),
              child:SingleChildScrollView(
                child: Column(
                  children: [
                    for(int i=0;i<Products.length-1;i+=2)
                      Row(
                        children: [
                          card(product: Products[i]),
                          card(product: Products[i+1]),
                        ],
                      ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget buildproduct(newProduct product) {
    return card(product: product);
  }

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Tìm kiếm sản phẩm',
    onChanged: searchProducts,
  );
  Future searchProducts(String query) async => debounce(() async {
    final products = await ProductApi.GetProductbyName(query);
    final List<newProduct> productslist= convertList(products);
    // final List<Datum> productresponse= await ProductApi.GetProduct();
    // print(productresponse[0].name);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.Products = productslist;
    });
  });
}


class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
            child: Icon(Icons.close, color: style.color),
            onTap: () {
              controller.clear();
              widget.onChanged('');
              FocusScope.of(context).requestFocus(FocusNode());
            },
          )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}


//
// List<String> _searchHistory = [];
// class searchField extends StatefulWidget {
//   const searchField({Key? key}) : super(key: key);
//
//   @override
//   _searchFieldState createState() => _searchFieldState();
// }
//
// class _searchFieldState extends State<searchField> {
//   List<newProduct>ProductList=[];
//   static const historyLength = 5;
//
//   late List<String> filteredSearchHistory;
//
//   String? selectedTerm;
//
//   List<String> filterSearchTerms({
//     required String? filter,
//   }) {
//     if (filter != null && filter.isNotEmpty) {
//       return _searchHistory.reversed
//           .where((term) => term.startsWith(filter))
//           .toList();
//     } else {
//       return _searchHistory.reversed.toList();
//     }
//   }
//
//   void addSearchTerm(String term) {
//     if (_searchHistory.contains(term)) {
//       putSearchTermFirst(term);
//       return;
//     }
//
//     _searchHistory.add(term);
//     if (_searchHistory.length > historyLength) {
//       _searchHistory.removeRange(0, _searchHistory.length - historyLength);
//     }
//
//     filteredSearchHistory = filterSearchTerms(filter: null);
//   }
//
//   void deleteSearchTerm(String term) {
//     _searchHistory.removeWhere((t) => t == term);
//     filteredSearchHistory = filterSearchTerms(filter: null);
//   }
//
//   void putSearchTermFirst(String term) {
//     deleteSearchTerm(term);
//     addSearchTerm(term);
//   }
//
//   late FloatingSearchBarController controller;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller = FloatingSearchBarController();
//     filteredSearchHistory = filterSearchTerms(filter: null);
//     init();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//   Future init() async {
//     final products=await ProductApi.GetProductbyName(selectedTerm!);
//     if(mounted)setState(() {
//       this.ProductList=convertList(products);
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FloatingSearchBar(
//         borderRadius: BorderRadius.circular(50),
//         controller: controller,
//         body: FloatingSearchBarScrollNotifier(
//           child: SearchResultsListView(
//             searchTerm: selectedTerm,
//           ),
//         ),
//         transition: CircularFloatingSearchBarTransition(),
//         // physics: BouncingScrollPhysics(),
//         // title: Text(
//         //   selectedTerm ?? 'The Search App',
//         //   style: Theme.of(context).textTheme.headline6,
//         // ),
//
//
//         hint: 'Search and find out...',
//         actions: [
//           FloatingSearchBarAction.searchToClear(),
//         ],
//         onQueryChanged: (query) {
//           setState(() {
//             filteredSearchHistory = filterSearchTerms(filter: query);
//           });
//         },
//         onSubmitted: (query) {
//           setState(() {
//             addSearchTerm(query);
//             selectedTerm = query;
//           });
//           controller.close();
//         },
//         builder: (context, transition) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Material(
//               color: Colors.white,
//               elevation: 4,
//               child: Builder(
//                 builder: (context) {
//                   if (filteredSearchHistory.isEmpty &&
//                       controller.query.isEmpty) {
//                     return Container(
//                       height: 56,
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Start searching',
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.caption,
//                       ),
//                     );
//                   } else if (filteredSearchHistory.isEmpty) {
//                     return ListTile(
//                       title: Text(controller.query),
//                       leading: const Icon(Icons.search),
//                       onTap: () {
//                         setState(() {
//                           addSearchTerm(controller.query);
//                           selectedTerm = controller.query;
//                         });
//                         controller.close();
//                       },
//                     );
//                   } else {
//                     return Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: filteredSearchHistory
//                           .map(
//                             (term) => ListTile(
//                           title: Text(
//                             term,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           leading: const Icon(Icons.history),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.clear),
//                             onPressed: () {
//                               setState(() {
//                                 deleteSearchTerm(term);
//                               });
//                             },
//                           ),
//                           onTap: () {
//                             setState(() {
//                               putSearchTermFirst(term);
//                               selectedTerm = term;
//                             });
//                             controller.close();
//                           },
//                         ),
//                       ).toList(),
//                     );
//                   }
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// class SearchResultsListView extends StatelessWidget {
//   final String? searchTerm;
//
//   const SearchResultsListView({
//     Key? key,
//     required this.searchTerm,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final fsb = FloatingSearchBar.of(context);
//     if(searchTerm == null) {
//       return Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Icons.search,
//               size: 64,
//             ),
//             Text(
//               'Start searching',
//               style: Theme.of(context).textTheme.headline5,
//             )
//           ],
//         ),
//       );
//     }
//     if(searchQuery(searchTerm).isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Icons.warning,
//               size: 64,
//             ),
//             Text(
//               'No results were found',
//               style: Theme.of(context).textTheme.headline5,
//             )
//           ],
//         ),
//       );
//     }
//       return SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.only(top: fsb.height),
//           child: Column(
//             children: [
//
//               for(int i=0;i<searchQuery(searchTerm).length-1;i+=2)
//                 Row(
//                   children: [
//                     card(product: searchQuery(searchTerm)[i]),
//                     card(product: searchQuery(searchTerm)[i+1]),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       );
//     }
//
// }

