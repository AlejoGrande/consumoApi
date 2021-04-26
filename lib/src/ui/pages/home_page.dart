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

  final key = GlobalKey<ScaffoldState>();

  Widget appbarTitle = Text(
    "USERS",
    style: TextStyle(color: Colors.white),
  );

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    appbarTitle = Text("Users",
    
        style: TextStyle(fontWeight: FontWeight.bold));
    return Scaffold(
        appBar: AppBar(
          title: appbarTitle,
          backgroundColor: Colors.deepPurple,
         
        ),
        body: _crearListado());
  }


  Widget _crearListado() {
    return FutureBuilder(
      future: usersProvider.users(),
      builder:
          (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        return snapshot.hasData
            ? new UserGridView(user: snapshot.data)
            : new Center(child: new CircularProgressIndicator());
      },
    );
  }
}