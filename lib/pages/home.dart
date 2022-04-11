import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings?.arguments as Map;
    print(data);

    //Set BG Image
    String bgImage = data['isDayTime'] == true ? "assets/day.png" : "assets/night.png";

    return Scaffold(
      body : Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(onPressed: (){Navigator.pushNamed(context, '/location');},
                  icon: const Icon(
                      Icons.edit_location,
                    color: Colors.white60,
                  ),
                  label: const Text(
                      "Change Location",
                    style: TextStyle(
                      color: Colors.white60
                    ),
                  )
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                        color: Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
