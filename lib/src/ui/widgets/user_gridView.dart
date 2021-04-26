import 'package:consumo_api/src/bloc/provider.dart';
import 'package:consumo_api/src/model/geo_model.dart';
import 'package:consumo_api/src/model/user_model.dart';
import 'package:flutter/material.dart';


class UserGridView extends StatelessWidget {
 
  final List<User> user;
  //var geo = new Geo();
  UserGridView({key, this.user}) : super(key: key);

  StreamBuilder getStructuredGridCell(User user, BuildContext context) {
    final bloc = ClassProvider.of(context);
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
                  margin: EdgeInsets.fromLTRB(20, 9, 20,0),
                  child: Column(
                    
                    children: <Widget>[
                      Icon(Icons.person_pin_outlined,size: 40,color: Colors.deepPurple,),
                      SizedBox(height: 5.0),
                      Text(user.name, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black87),),
                      SizedBox(height: 10.0),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                      InkWell(
                        
                        onTap: (){
                          bloc.changelat(user.address.geo.lat);
                          bloc.changelong(user.address.geo.lng);
                          Navigator.pushNamed(context, "map");
                        },
                        child: new Container(
                        height: 70,
                        width: 70,                            
                            decoration: new BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border(
                                left: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,),
                                    
                                right: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,),
                                    
                                top: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,),
                                    
                                bottom: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 2,),
                                    ),
                              image: new DecorationImage(
                                  image: new AssetImage('lib/src/assets/img/lupa.jpg'),
                                  fit: BoxFit.cover)),
                            ),
                       ),
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