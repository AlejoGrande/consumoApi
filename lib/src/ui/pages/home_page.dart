import 'package:consumo_api/src/model/user_model.dart';
import 'package:consumo_api/src/provider/users_provider.dart';
import 'package:consumo_api/src/ui/widgets/user_gridView.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usersProvider = new UsersProvider();

  final List<User> itemList = null;

  final TextEditingController _searchQuery = TextEditingController();

  final key = GlobalKey<ScaffoldState>();
  bool _IsSearching;
  String _searchText = "";
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  Widget appbarTitle = Text(
    "Devices",
    style: TextStyle(color: Colors.white),
  );

  @override
  void initState() {
    super.initState();
    _IsSearching = false;

  }


  @override
  Widget build(BuildContext context) {
    appbarTitle = Text("HOME PAGE",
        style: TextStyle(fontWeight: FontWeight.bold));
    return Scaffold(
        appBar: AppBar(
          title: appbarTitle,
          backgroundColor: Color(0xFF002856),
         
        ),
        body: _crearListado());
  }

  // List<Model> _buildSearchList() {
  //   if (_searchText.isEmpty) {
  //     return _searchList = _list;
  //   } else {
  //     _searchList = _list
  //         .where((element) =>
  //             element.name.toLowerCase().contains(_searchText.toLowerCase()) ||
  //             element.title.toLowerCase().contains(_searchText.toLowerCase()))
  //         .toList();
  //     print('${_searchList.length}');
  //     return _searchList;
  //   }
  // }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd(BuildContext context) {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appbarTitle = Text(
       "sds",
        style: TextStyle(fontWeight: FontWeight.bold),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: usersProvider.users(),
      builder:
          (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        return snapshot.hasData
            ? new UserGridView(device: snapshot.data)
            : new Center(child: new CircularProgressIndicator());
      },
    );
  }
}