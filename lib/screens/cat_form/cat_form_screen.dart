// ignore_for_file: use_build_context_synchronously

import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/provider/cat_form_provider.dart';
import 'package:cat_alogue/services/utils/surround.dart';
import 'package:cat_alogue/widgets/input/single_image_picker.dart';
import 'package:cat_alogue/widgets/menu/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stilo/stilo.dart';

class CatFormPage extends ConsumerWidget with Surround {
  final Cat? initialCatData;
  final _formKey = GlobalKey<FormState>();

  CatFormPage({
    Key? key,
    this.initialCatData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _catForm = ref.watch(catFormProvider(initialCatData).notifier);
    final _cat = ref.watch(
      catFormProvider(initialCatData));

    return Scaffold(
      appBar: Navbar(
        title: _cat.id == null ? 'New cat' : 'Edit cat',
        backgroundColor: Colors.blue,
        centerTitle: false,
        actions: [
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: () async {
              _formKey.currentState!.save();
              if (!_formKey.currentState!.validate()) return;

              final hasSaved = await _catForm.saveCat();

              if (hasSaved) {
                Navigator.of(context).pop();
                showConcatulationsDialog(context);
              } else {
                //TODO: handle when form has not been saved
              }
            },
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
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StiloSpacing.vert2,
                Center(
                  child: SingleImagePicker(
                    isCircle: true,
                    initialImage: _cat.profileImg,
                    onTap: () => _catForm.getProfileImage(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.grey,
                        ),
                        Text(
                          'Select picture',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                StiloSpacing.vert3,
                FormBuilderTextField(
                  name: 'name',
                  initialValue: initialCatData?.name,
                  onChanged: (value) =>
                      _catForm.cat = _cat.copyWith(name: value ?? ''),
                  decoration: const InputDecoration(
                    labelText: 'Cat name',
                    prefixIcon: Icon(Icons.text_fields),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Please add a name'
                    ),
                  ]),
                ),
                StiloSpacing.vert3,
                FormBuilderTextField(
                  name: 'description',
                  initialValue: initialCatData?.description,
                  onChanged: (value) =>
                      _catForm.cat = _cat.copyWith(description: value),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  maxLength: 120,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    prefixIcon: Icon(Icons.description),
                  ),
                ),
                StiloSpacing.vert3,
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'location',
                        controller: TextEditingController(
                          text: _cat.location?.address,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Location found',
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      ),
                    ),
                    StiloSpacing.horiz1,
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: TextButton(
                        onPressed: () async =>
                            _catForm.getAddressFromLocation(),
                        child: const Icon(Icons.gps_fixed),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
