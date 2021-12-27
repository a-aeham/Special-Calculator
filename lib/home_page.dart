import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController billAmountController = TextEditingController();

  TextEditingController oneController = TextEditingController();

  TextEditingController fiveController = TextEditingController();

  late double billAmount,
      roundedBillAmount,
      finalBillAmount,
      bankBonus,
      fees = 11000,
      onePkg,
      fivePkg,
      onePkgBonus,
      fivePkgBonus;

  void calculate() {
    setState(() {
      if (billAmountController.text == '') {
        billAmount = 0;
      } else {
        billAmount = double.parse(billAmountController.text);
      }
      if (oneController.text == '') {
        onePkg = 0;
      } else {
        onePkg = double.parse(oneController.text);
      }
      if (fiveController.text == '') {
        fivePkg = 0;
      } else {
        fivePkg = double.parse(fiveController.text);
      }

      double round = billAmount % 250;
      round = 250 - round;
      roundedBillAmount = billAmount + round;

      bankBonus = roundedBillAmount * 0.01;

      onePkgBonus = onePkg * 2500;
      fivePkgBonus = fivePkg * 1000;

      finalBillAmount =
          roundedBillAmount + bankBonus + onePkgBonus + fivePkgBonus + fees;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF34AF8D),
        title: const Text(
          'Al-Rafidain Bank',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4,
              fontFamily: 'Nunito'),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Transform.translate(
                offset: const Offset(7.0, 0.0),
                child: Image.asset(
                  'images/logo.jpg',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: billAmountController,
                style: const TextStyle(
                  color: Color(0xFF34AF8D),
                  fontFamily: 'credc',
                  fontSize: 14,
                ),
                cursorColor: const Color(0xFF34AF8D),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Bill Amount',
                  labelStyle: const TextStyle(
                    color: Color(0xFF34AF8D),
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: Color(0xFF34AF8D),
                      width: 1.3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: Colors.teal, width: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: oneController,
                      style: const TextStyle(
                        color: Color(0xFF34AF8D),
                        fontFamily: 'credc',
                        fontSize: 14,
                      ),
                      cursorColor: const Color(0xFF34AF8D),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: '1K PKG',
                        labelStyle: const TextStyle(
                          color: Color(0xFF34AF8D),
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Color(0xFF34AF8D),
                            width: 1.3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: fiveController,
                      style: const TextStyle(
                        color: Color(0xFF34AF8D),
                        fontFamily: 'credc',
                        fontSize: 14,
                      ),
                      cursorColor: const Color(0xFF34AF8D),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: '5K PKG',
                        labelStyle: const TextStyle(
                          color: Color(0xFF34AF8D),
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Color(0xFF34AF8D),
                            width: 1.3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              MaterialButton(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                padding: const EdgeInsets.all(15),
                minWidth: double.infinity,
                color: const Color(0xFF34AF8D),
                onPressed: () {
                  calculate();
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text(
                            '${finalBillAmount.toInt()} IQD',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'credc',
                            ),
                          ),
                          content: Container(
                            height: 320,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bank Commission : ',
                                      style: TextStyle(fontFamily: 'Nunito'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${bankBonus.toInt()} ',
                                          style: TextStyle(fontFamily: 'credc'),
                                        ),
                                        Text(
                                          ' IQD',
                                          style:
                                              TextStyle(fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '1K Packages Commission : ',
                                      style: TextStyle(fontFamily: 'Nunito'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '$onePkgBonus ',
                                          style: TextStyle(fontFamily: 'credc'),
                                        ),
                                        Text(
                                          ' IQD',
                                          style:
                                              TextStyle(fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '5K Packages Commission : ',
                                      style: TextStyle(fontFamily: 'Nunito'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '$fivePkgBonus ',
                                          style: TextStyle(fontFamily: 'credc'),
                                        ),
                                        Text(
                                          ' IQD',
                                          style:
                                              TextStyle(fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Publication Fee : ',
                                      style: TextStyle(fontFamily: 'Nunito'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '5000 ',
                                          style: TextStyle(fontFamily: 'credc'),
                                        ),
                                        Text(
                                          ' IQD',
                                          style:
                                              TextStyle(fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Stamps Fee : ',
                                      style: TextStyle(fontFamily: 'Nunito'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '5000 ',
                                          style: TextStyle(fontFamily: 'credc'),
                                        ),
                                        Text(
                                          ' IQD',
                                          style:
                                              TextStyle(fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'School Support Fee : ',
                                      style: TextStyle(fontFamily: 'Nunito'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '1000 ',
                                          style: TextStyle(fontFamily: 'credc'),
                                        ),
                                        Text(
                                          ' IQD',
                                          style:
                                              TextStyle(fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Text(
                  'Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.copyright,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'NTU',
                    style: TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
