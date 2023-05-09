import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BMICalculatorScreen(),
    );
  }
}

enum Gender {
  male,
  female,
}

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double height = 0;
  double weight = 0;
  int age = 0;
  double bmi = 0;
  Gender? selectedGender;
  double heightSliderValue = 50.0;
  double weightSliderValue = 50.0;
  double ageSliderValue = 25.0;


  void calculateBMI() {
    setState(() {
      double heightInMeters = height / 100;
      bmi = weight / (heightInMeters * heightInMeters);
      if (selectedGender == Gender.male) {
        bmi -= age / 10;
      } else {
        bmi += age / 10;
      }
    });
  }
  String getBMI(){
    double heightInMeters = height / 100;
    bmi = weight / (heightInMeters * heightInMeters);
    if (selectedGender == Gender.male) {
      bmi -= age / 10;
    } else {
      bmi += age / 10;
    }
    String kq = bmi.toStringAsFixed(1);
    return kq;
  }
  String getBMICategory() {
    if (bmi < 16.0) {
      return 'You should go for a health check !';
    } else if (bmi >= 16.0 && bmi < 17.0) {
      return 'Let\'s add food';
    } else if (bmi >= 17.0 && bmi < 18.5) {
      return 'Let\'s add food';
    } else if (bmi >= 18.5 && bmi < 25.0) {
      return 'You have an ideal body';
    } else if (bmi >= 25.0 && bmi < 30.0) {
      return 'let\'s do some exercise';
    } else if (bmi >= 30.0 && bmi < 35.0) {
      return 'let\'s do some exercise';
    } else if (bmi >= 35.0 && bmi < 40.0) {
      return 'you should go for a health check !';
    } else {
      return 'you should go for a health check !';
    }
  }
  String getIdealWeight() {
    double idealWeight;
    if (selectedGender == Gender.male) {
      idealWeight = (height - 100) * 0.9;
    } else {
      idealWeight = (height - 100) * 0.85;
    }
    String kq = "?";
    if (idealWeight > 0) kq =  idealWeight.toStringAsFixed(1);
    return kq;
  }
  Color getcolorIdealWeight(){
    Color color;
    if (getIdealWeight()=='?')  color = Colors.grey;
    else color = Colors.green;
    return color;
  }
  Color getcolorBMI(){
    if (bmi < 16.0) {
      return Colors.redAccent;
    } else if (bmi >= 16.0 && bmi < 17.0) {
      return Colors.deepOrangeAccent;
    } else if (bmi >= 17.0 && bmi < 18.5) {
      return Colors.amberAccent;
    } else if (bmi >= 18.5 && bmi < 25.0) {
      return Colors.green;
    } else if (bmi >= 25.0 && bmi < 30.0) {
      return Colors.amberAccent;
    } else if (bmi >= 30.0 && bmi < 35.0) {
      return Colors.deepOrangeAccent;
    } else if (bmi >= 35.0 && bmi < 40.0) {
      return Colors.redAccent;
    } else {
      return Colors.red;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: Gender.male,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value as Gender?;
                    });
                  },
                ),
                Text('Male'),
                Radio(
                  value: Gender.female,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Heigth $height (cm)',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      height--;
                    });
                  },
                  icon: Icon(Icons.remove),
                  iconSize: 24,
                  padding: EdgeInsets.all(0),
                ),
                Container(
                  width: 230, // Đặt chiều rộng mong muốn
                  child: Slider(
                    value: heightSliderValue,
                    min: 0,
                    max: 200,
                    divisions: 200,
                    onChanged: (double value) {
                      setState(() {
                        heightSliderValue = value;
                        height = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {setState(() {
                    height++;
                  });},
                  icon: Icon(Icons.add),
                  iconSize: 24,
                  padding: EdgeInsets.all(0),
                ),
              ],
            ),

            SizedBox(height: 10),
            Text(
              'Weight $weight (kg)',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      weight--;
                    });
                  },
                  icon: Icon(Icons.remove),
                  iconSize: 24,
                  padding: EdgeInsets.all(0),
                ),
                Container(
                  width: 230, // Đặt chiều rộng mong muốn
                  child: Slider(
                    value: weightSliderValue,
                    min: 0,
                    max: 200,
                    divisions: 200,
                    onChanged: (double value) {
                      setState(() {
                        weightSliderValue = value;
                        weight = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {setState(() {
                    weight++;
                  });},
                  icon: Icon(Icons.add),
                  iconSize: 24,
                  padding: EdgeInsets.all(0),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Age $age',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      age--;
                    });
                  },
                  icon: Icon(Icons.remove),
                  iconSize: 24,
                  padding: EdgeInsets.all(0),
                ),
                Container(
                  width: 230, // Đặt chiều rộng mong muốn
                  child: Slider(
                    value: ageSliderValue,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    onChanged: (double value) {
                      setState(() {
                        ageSliderValue = value;
                        age = value.toInt();
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {setState(() {
                    age++;
                  });},
                  icon: Icon(Icons.add),
                  iconSize: 24,
                  padding: EdgeInsets.all(0),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('MBI:'+
              getBMI(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: getcolorBMI()),
            ),
            Text(
              'Ideal Weight: ${getIdealWeight()} kg',
              style: TextStyle(fontSize: 18,color: getcolorIdealWeight()),
            ),
            Text(
              getBMICategory(),
              style: TextStyle(fontSize: 18,color: getcolorIdealWeight()),
            ),
        Expanded(
          child: SingleChildScrollView(
            child: DataTable(
              columns: [
                DataColumn(label: Text('BMI Range',style: TextStyle(color: Colors.green),)),
                DataColumn(label: Text('Category',style: TextStyle(color: Colors.green),)),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('Less than 16.0',style: TextStyle(color: Colors.deepOrange),)),
                    DataCell(Text('Severe Thinness',style: TextStyle(color: Colors.deepOrange),)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('16.0 - 16.9',style: TextStyle(color: Colors.amber),)),
                    DataCell(Text('Moderate Thinness',style: TextStyle(color: Colors.amber),)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('17.0 - 18.4',style: TextStyle(color: Colors.green),)),
                    DataCell(Text('Mild Thinness',style: TextStyle(color: Colors.green),)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('18.5 - 24.9',style: TextStyle(color: Colors.amber),)),
                    DataCell(Text('Normal weight',style: TextStyle(color: Colors.amber),)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('25.0 - 29.9',style: TextStyle(color: Colors.deepOrangeAccent),)),
                    DataCell(Text('Overweight',style: TextStyle(color: Colors.deepOrangeAccent),)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('30.0 - 34.9',style: TextStyle(color: Colors.redAccent),)),
                    DataCell(Text('Obese Class I',style: TextStyle(color: Colors.redAccent),)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('35.0 - 39.9',style: TextStyle(color: Colors.red),)),
                    DataCell(Text('Obese Class II',style: TextStyle(color: Colors.red),)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('40.0 or greater',style: TextStyle(color: Colors.redAccent),)),
                    DataCell(Text('Obese Class III',style: TextStyle(color: Colors.redAccent),)),
                  ],
                ),
              ],
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
