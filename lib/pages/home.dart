import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty?data:ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);

    String bgimage=data['isDayTime']?'day.png':'night.png';
    Color bgcolor=data['isDayTime']?Colors.blue:Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            ),
          ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result=await Navigator.pushNamed(context,'/location');
                    setState(() {
                      data={
                        'time':result['time'],
                        'location':result['location'],
                        'isDayTime':result['isDayTime'],
                        'flag':result['flag'],
                      };
                    });
                  },
                icon: Icon(
                    Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                    'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      data['location'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height:40.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
      ),
    ),
    ),
    );
  }
}
