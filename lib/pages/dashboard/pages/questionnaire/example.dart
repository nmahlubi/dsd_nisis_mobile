import 'package:dsd_nisis_mobile/pages/dashboard/pages/questionnaire/questionaire_sections/section_household_particulars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widget/textfield_dropdown.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Row(children: [
        Text("3.1 Which social clubs/associations/organizations \n does...belong to?"),
        const Text('Social clubs/Associations/Organizations'),
        DropDown(),
      ],),
      Row(children: [
        Text("3.2 Does... Having the ability to influence \n in the social groups which he/she \n participate in?"),
        Text('Sent Message:'),
        Expanded(child:Icon(Icons.info) ),

      ],),
    ],);
  }
}
