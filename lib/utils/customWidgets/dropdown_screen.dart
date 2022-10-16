import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/helpers/global.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => DropDownPage();
}

class DropDownPage extends State<DropDown> {
  String? dropdownvalue;
  Color _color = Colors.white;

  // List of items in our dropdown menu
  var items = [
    'Mobile',
    'Web',
    'Desktop',
    'Embedded',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 400,
        width: double.infinity,
        //padding: const EdgeInsets.all(10),
        //margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 33)
            ],
            border: Border.all(color: Colors.black, width: 2),
            gradient: const LinearGradient(colors: [
              Colors.white,
              Colors.green,
            ]),
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'DropDown Button',
              style: TextStyle(
                  fontSize: 25,
                  // color: Colors.purple,
                  fontWeight: FontWeight.w700,
                  //fontStyle: FontStyle.italic,
                  letterSpacing: 8,
                  wordSpacing: 20,
                  backgroundColor: Colors.white30,
                  shadows: [
                    Shadow(
                        color: Colors.blueAccent,
                        offset: Offset(2, 1),
                        blurRadius: 10)
                  ]),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 40,
            ),

            DropdownButton(
              alignment: Alignment.bottomRight,
              isDense: true,
              style: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.4),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 50.5,
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
              // To disable dropdown button, set items or onchanged to null
              // onChanged: null,
              // items: [...],
              value: dropdownvalue,
              hint: const Text('Multi-Platform '),
            ),
            const SizedBox(
              //Use of SizedBox
              height: 70,
            ),
            const Text(
              'PopupMenu Button',
              style: TextStyle(
                  fontSize: 25,
                  // color: Colors.purple,
                  fontWeight: FontWeight.w700,
                  //fontStyle: FontStyle.italic,
                  letterSpacing: 8,
                  wordSpacing: 20,
                  backgroundColor: Colors.white30,
                  shadows: [
                    Shadow(
                        color: Colors.blueAccent,
                        offset: Offset(2, 1),
                        blurRadius: 10)
                  ]),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 40,
            ),
            PopupMenuButton(
              offset: const Offset(0, 40),
              constraints: const BoxConstraints.expand(width: 500, height: 200),
              tooltip: "Popup Menu Dropdown",
              color: Colors.blueGrey,
              // offset: const Offset(0, 0),
              child: const Center(
                child: Text(
                  'Multi-Platform ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              itemBuilder: (context) {
                return items.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList();
              },
              onSelected: (String index) {
                printDebug('index is $index');
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              // child: Icon(
              //   Icons.lightbulb_outline,
              //   color: _lightIsOn ? Colors.yellow.shade600 : Colors.black,
              //   size: 60,
              // ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _color == Colors.yellow
                      ? _color = Colors.white
                      : _color = Colors.yellow;
                });
                // print("tab click");
              },
              // onDoubleTap: () {
              //   print("double click");
              // },
              // onDoubleTapCancel: () {
              //   print("cancel click");
              // },
              child: Container(
                color: _color,
                height: 100.0,
                width: 100.0,
                // color: Colors.yellow.shade600,
                padding: const EdgeInsets.all(8),
                // Change button text when light changes state.
                child: const Text('Click here'),
              ),
            ),

            // Card(
            //   color: Colors.amber,
            //   child: Row(
            //     children: const [
            //       //  Icon(Icons.description),
            //       SizedBox(width: 20.0),
            //       Expanded(
            //         flex: 30,
            //         child: Text(
            //             "ksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakkkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasass"),
            //       ),
            //     ],
            //   ),
            // ),

            // Flexible(

            //     //newly added

            //     child: Container(
            //   padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
            //   child: const Text(
            //       "sasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskkasasasasasasassksasakkdkdsakdskdsakdakdakakkkasasasasasasassksasakkdkdsakdskdsakdakdakakkkasasasasasasassksasakkdkdsakdskdsakdakdakakkkasasasasasasassksasakkdkdsakdskdsakdakdakakkaskkasasasasasasassksasakkdkdsaksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasassksasakkdkdsakdskdsakdakdakakakaaskaskaskakskaskkasasasasasasass",
            //       style: TextStyle(),
            //       softWrap: true),
            // ))
          ],
        ),
      ),
    );
  }
}




//  shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(15.0))),