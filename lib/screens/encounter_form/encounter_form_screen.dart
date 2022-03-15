import 'package:cat_alogue/models/encounter/encounter.dart';
import 'package:cat_alogue/widgets/input/multi_media_picker/multi_media_picker.dart';
import 'package:cat_alogue/widgets/menu/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stilo/stilo.dart';

class EncounterFormScreen extends HookConsumerWidget {
  final Encounter? initialEncounterData;
  final _formKey = GlobalKey<FormState>();

  EncounterFormScreen({
    Key? key,
    this.initialEncounterData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final _encounterForm = ref.read(catFormProvider(initialCatData).notifier);
    // final _encounter = ref.watch(catFormProvider(initialCatData));

    return Scaffold(
      appBar: Navbar(
        // title: _encounter.id == null ? 'New encounter' : 'Edit encounter',
        backgroundColor: Colors.blue,
        centerTitle: false,
        actions: [
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: () async {},
            icon: const Icon(Icons.save),
            label: const Text(
              'Save',
            ),
          )
        ],
      ),
      body: Padding(
        padding: StiloEdge.all2,
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                MultiMediaPicker(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
