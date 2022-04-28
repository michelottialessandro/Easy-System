import 'package:flutter/material.dart';
import 'mywidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'funzioni.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fraction/fraction.dart';
import "info.dart";

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    initialization();
  }

  final mController = TextEditingController();
  final yController = TextEditingController();
  final qController = TextEditingController();
  final mController1 = TextEditingController();
  final yController1 = TextEditingController();
  final qController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/foresta.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
            Column(
              
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: ContainerBuilder(
                              colore: Colors.green,
                              controller: yController,
                              text: "Incognita y",
                              tcolor: Colors.black)),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: ContainerBuilder(
                              colore: Colors.green,
                              controller: qController,
                              text: "Termine noto",
                              tcolor: Colors.black)),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: ContainerBuilder(
                              colore: Colors.green,
                              controller: mController,
                              text: "Coefficiente",
                              tcolor: Colors.black)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: ContainerBuilder(
                              colore: Colors.green,
                              controller: yController1,
                              text: "Incognita y",
                              tcolor: Colors.black)),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: ContainerBuilder(
                              colore: Colors.green,
                              controller: qController1,
                              text: "Termine noto",
                              tcolor: Colors.black)),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: ContainerBuilder(
                              colore: Colors.green,
                              controller: mController1,
                              text: "Coefficiente",
                              tcolor: Colors.black)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Mybutton("Risolvere", () {
                      setState(() {
                        cpunti1 = [];
                        cpunti2 = [];
                        double x =
                            Fraction.fromString(mController.text).toDouble();
                        double y =
                            Fraction.fromString(yController.text).toDouble();
                        double q =
                            Fraction.fromString(qController.text).toDouble();
                        calcoloPunti(x, y, q, "1");
                        x = Fraction.fromString(mController1.text).toDouble();
                        y = Fraction.fromString(yController1.text).toDouble();
                        q = Fraction.fromString(qController1.text).toDouble();
                        calcoloPunti(x, y, q, "2");
                      });
                    }),
                  ),
                ),
                if (cpunti1.isNotEmpty && cpunti2.isNotEmpty)
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        // Chart title
                        plotAreaBackgroundColor: Colors.transparent,
                        borderColor: Colors.transparent,
                        plotAreaBorderWidth: 2,
                        plotAreaBorderColor: Colors.black,
                        title: ChartTitle(
                        text: 'Rette',
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),

                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<Punto, double>>[
                          LineSeries<Punto, double>(
                              dataSource: cpunti1,
                              color: const Color.fromARGB(199, 120, 0, 200),
                              xValueMapper: (Punto px, _) => px.x,
                              yValueMapper: (Punto py, _) => py.y,
                              // Enable data label

                              name: "Retta 1",
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: true,
                              )),
                          LineSeries<Punto, double>(
                            dataSource: cpunti2,
                            xValueMapper: (Punto px, _) => px.x,
                            yValueMapper: (Punto py, _) => py.y,
                            color: Colors.blue,
                            name: "Retta 2",
                            // Enable data label
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.green,
        alignment: Alignment.center,
        child: Row(
          children: [
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Info()));
                  },
                  icon: const Icon(Icons.info)),
            ),
            if (cpunti1.isNotEmpty && cpunti2.isNotEmpty)
              Text(
                Risultato(
                  x1: mController.text,
                  y1: yController.text,
                  q1: qController.text,
                  x2: mController1.text,
                  y2: yController1.text,
                  q2: qController1.text,
                ),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
