import 'package:flutter/material.dart';
import 'package:newapp/constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 75;
  String gender = '';

  late double calulateBmi = calculateBMI(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("male");
                        setState(() {
                          gender = 'M';
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 175,
                        decoration: BoxDecoration(
                            color: gender == 'M'
                                ? Colors.pinkAccent.withAlpha(150)
                                : Colors.pinkAccent.withAlpha(40),
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(8.0),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.male,
                              size: 150,
                            ),
                            Text("Male")
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        print("Female");
                        setState(() {
                          gender = 'F';
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 175,
                        decoration: BoxDecoration(
                            color: gender == 'F'
                                ? Colors.pinkAccent.withAlpha(150)
                                : Colors.pinkAccent.withAlpha(40),
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(8.0),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.female,
                              size: 150,
                            ),
                            Text("Female")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Height (CM)"),
                          Text("$height", style: kinputLabColor),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height > 50) {
                                      height--;
                                      calulateBmi = calculateBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height < 225) {
                                      height++;
                                      calulateBmi = calculateBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Weight (KG)"),
                          Text("$weight", style: kinputLabColor),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 30) {
                                      weight--;
                                      calulateBmi = calculateBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 200) {
                                      weight++;
                                      calulateBmi = calculateBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    const Text("BMI"),
                    Text(
                      "${calulateBmi.toStringAsFixed(2)}",
                      style: kinputLabColor.copyWith(
                        color: kBMIColor,
                      ),
                    ),
                    Text(getResult(calulateBmi))
                  ],
                )
              ],
            )),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'Overweight';
    } else if (bmiValue > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
