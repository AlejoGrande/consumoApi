import 'package:consumo_api/src/model/user_model.dart';
import 'package:flutter/material.dart';


class UserGridView extends StatelessWidget {
 
  final List<User> device;

  UserGridView({key, this.device}) : super(key: key);

  StreamBuilder getStructuredGridCell(User user, BuildContext context) {
    return StreamBuilder(
        
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return new InkWell(
              onTap: () {               
              },
              child: new Card(
                color: Colors.white,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.person_pin_outlined,size: 40,),
                    Text(user.name),
                    Text(user.email),
                    Text(user.address.city),
                    Text(user.company.name),
                    
                    
                  ],

                  /*
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                
                                Text(" ",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(user.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                       color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0),
                            child: Text(
                              user.name,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 9.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.0),
                        ],
                      ),
                    
                  ],
                */),
              ));
        });
  }

  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      crossAxisCount: 1,
      padding: EdgeInsets.all(8.0),
      childAspectRatio: 8.0 / 7.2,
      children: List.generate(device.length, (index) {
        return getStructuredGridCell(device[index], context);
      }),
    );
  }

  bool estado(String value) {
    if (value == "ACTIVED") {
      return true;
    } else
      return false;
  }
}