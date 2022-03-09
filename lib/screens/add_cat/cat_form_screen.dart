import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/provider/cat_form_provider.dart';
import 'package:cat_alogue/services/utils/surround.dart';
import 'package:cat_alogue/widgets/input/image_picker.dart';
import 'package:cat_alogue/widgets/menu/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stilo/stilo.dart';

class CatFormPage extends HookWidget with Surround {
  final Cat? cat;
  final _formKey = GlobalKey<FormState>();

  CatFormPage({
    Key? key,
    this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: body_might_complete_normally_nullable
    useEffect(() {
      context.read(catFormProvider).initState(cat);
    }, []);

    final _cat = useProvider(catProvider);

    return Scaffold(
      appBar: Navbar(
        title: _cat.state.id == null ? 'New cat' : 'Edit cat',
        backgroundColor: Colors.blue,
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
                  child: ImagePicker(
                    isCircle: true,
                    initialImage: _cat.state.profileImg,
                    onTap: () =>
                        context.read(catFormProvider).getProfileImage(),
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
                  initialValue: cat?.name,
                  onChanged: (value) =>
                      _cat.state = _cat.state.copyWith(name: value ?? ''),
                  decoration: const InputDecoration(
                    labelText: 'Cat name',
                    prefixIcon: Icon(Icons.text_fields),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
                StiloSpacing.vert3,
                FormBuilderTextField(
                  name: 'description',
                  initialValue: cat?.description,
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
                          text: _cat.state.location?.address,
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
                        onPressed: () async => context
                            .read(catFormProvider)
                            .getAddressFromLocation(),
                        child: const Icon(Icons.gps_fixed),
                      ),
                    ),
                  ],
                ),
                StiloSpacing.vert3,
                ElevatedButton.icon(
                  onPressed: () async {
                    await context.read(catFormProvider).saveCat();

                    Navigator.of(context).pop();
                    if (cat?.id == null) showConcatulationsDialog(context);
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Save Cat'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
