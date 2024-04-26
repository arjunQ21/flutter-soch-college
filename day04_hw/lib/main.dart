import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: WeatherWidget(),
    ),
  );
}

class WeatherWidget extends StatelessWidget {
  WeatherWidget({
    super.key,
  });

  TextStyle textKoStyle = TextStyle(
    fontSize: 45,
    height: 1,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather Widget")),
      body: Center(
        child: Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StyledBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "12 C",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Cloudy Day".toUpperCase())
                        ]),
                  ),
                  StyledBox(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Alarm"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "11:45",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 5,
                                  left: 2,
                                ),
                                child: Text("AM"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("S"),
                              SizedBox(
                                width: 5,
                              ),
                              Text("M"),
                              SizedBox(
                                width: 5,
                              ),
                              Text("T"),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "W",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("T"),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "F",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("S"),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          )
                        ]),
                  ),
                ],
              ),
              StyledBox(
                child: Column(children: [
                  Text(
                    "22",
                    style: textKoStyle,
                  ),
                  Transform.rotate(
                    angle: 3.14 / 2,
                    child: Text(
                      ":",
                      style: textKoStyle,
                    ),
                  ),
                  Text(
                    "56",
                    style: textKoStyle,
                  ),
                  Text("MON 2 MAY, 2022"),
                  Text("RAY"),
                ]),
                height: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StyledBox extends StatelessWidget {
  final Widget child;
  double height;
  StyledBox({
    required this.child,
    this.height = 140,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(4, 4),
            spreadRadius: 3,
            color: Colors.black.withOpacity(0.4),
          )
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
