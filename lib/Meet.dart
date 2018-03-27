
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Meet extends StatelessWidget {


   @override
  Widget build(BuildContext context) {

    void _openProfile() {
     Navigator.of(context).push(
       new MaterialPageRoute(
         builder: (context){
           return new Icon(CupertinoIcons.profile_circled);
         }
       )
     );

     return new 
    }

    return new ListView.builder(
      itemBuilder: (context, i){
        if (i.isOdd) return new Divider();
        return new ListTile( 
          leading: new CircleAvatar(
            backgroundImage: new AssetImage('kim.jpg'),
            backgroundColor: CupertinoColors.lightBackgroundGray,
            radius: 30.0,
          ),
          dense: false,
          title: new Text("Kim. K", 
          style: new TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: new Text("Looking for very serious partner", 
          style: new TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            ),
          ),
          trailing: new IconButton(
            icon: new Icon(CupertinoIcons.conversation_bubble, 
            size: 35.0, 
            semanticLabel: "Hello",
            color: CupertinoColors.activeBlue
            ),
            onPressed: null,
            //TODO: Implement onPressed to go straight to messages
          ),
          enabled: false,
          onTap: _openProfile(),
        );
      },
      itemCount: 20
    );
  }
}