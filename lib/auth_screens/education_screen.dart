import 'dart:developer';

import 'package:emori/utilities/auth_constants.dart';
import 'package:emori/utilities/widgets/auth_widgets/container_button.dart';
import 'package:flutter/material.dart';

class EducationSelectionScreen extends StatefulWidget {
  const EducationSelectionScreen({Key? key}) : super(key: key);

  @override
  State<EducationSelectionScreen> createState() =>
      _EducationSelectionScreenState();
}

class _EducationSelectionScreenState extends State<EducationSelectionScreen> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 50.0,
                    onPressed: () {
                      Navigator.pop(context);
                      log('Returning to gender selection screen');
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: kActiveYellow,
                  ),
                ],
              ),
              Row(
                children: [
                  kInputTextHeading(
                      'Atzīmē savu\nizglītības līmeni ', kActiveYellow, 40)
                ],
              ),
              kSizedBox(20.0),
              Column(
                children: [
                  ContainerButton<int>(
                    value: 1,
                    groupValue: _value,
                    title: 'Pamata (nepabeigta)',
                    onChanged: (value) => setState(() => _value = value!),
                  ),
                  kSizedBox(20.0),
                  ContainerButton<int>(
                    value: 2,
                    groupValue: _value,
                    title: 'Pamata',
                    onChanged: (value) => setState(() => _value = value!),
                  ),
                  kSizedBox(20.0),
                  ContainerButton<int>(
                    value: 3,
                    groupValue: _value,
                    title: 'Vidējā',
                    onChanged: (value) => setState(() => _value = value!),
                  ),
                  kSizedBox(20.0),
                  ContainerButton<int>(
                    value: 4,
                    groupValue: _value,
                    title: 'Augstākā',
                    onChanged: (value) => setState(() => _value = value!),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 50.0,
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        log('Moving to education selection screen');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EducationSelectionScreen()));
                        // }
                      },
                      icon: const Icon(Icons.arrow_forward),
                      color: kActiveYellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
