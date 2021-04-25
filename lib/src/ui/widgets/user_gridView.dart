import 'package:consumo_api/src/model/user_model.dart';
import 'package:flutter/material.dart';


class UserGridView extends StatelessWidget {
 
  final List<User> user;

  UserGridView({key, this.user}) : super(key: key);

  StreamBuilder getStructuredGridCell(User user, BuildContext context) {
    return StreamBuilder(
        
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return new InkWell(
              onTap: () {               
              },
              child: new Card(
                color: Colors.white,
                elevation: 7.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(9),
                  child: Column(
                    
                    children: <Widget>[
                      Icon(Icons.person_pin_outlined,size: 40,color: Colors.deepPurple,),
                      SizedBox(height: 5.0),
                      Text(user.name, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold) ,),
                      SizedBox(height: 10.0),
                      
                      Row(
                        children: [                        
                          Icon(Icons.email_outlined,color: Colors.deepPurple,),
                           SizedBox(width:10),
                          Text(user.email),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.home_work_outlined,color: Colors.deepPurple,),
                          SizedBox(width:10),
                          Text(user.company.name),
                          
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,color: Colors.deepPurple,),
                          SizedBox(width:10),
                          Text(user.address.city),
                        ],
                      ),
                      
                    ],
                   
                  ),
                ),
              ));
        });
  }

  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      crossAxisCount: 1,
      padding: EdgeInsets.all(20.0),
      childAspectRatio: 8.0 / 4.6,
      children: List.generate(user.length, (index) {
        return getStructuredGridCell(user[index], context);
      }),
    );
  }


}