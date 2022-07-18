import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DefaultTextFieldWdiget extends StatelessWidget {
  final String id;
  final String labelText;
  final List<String? Function(String?)>? validators;
  final String? initialValue;
  const DefaultTextFieldWdiget(
      {Key? key, required this.id, required this.labelText, this.validators, this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        name: id,
        initialValue: initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: TextInputAction.next,
        textCapitalization: labelText.toLowerCase() == 'name'
            ? TextCapitalization.words
            : TextCapitalization.none,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey)),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator:
            FormBuilderValidators.compose(getValidators(context, validators)));
  }

  List<FormFieldValidator<String>> getValidators(
      BuildContext context, List<String? Function(String?)>? validators) {
    List<FormFieldValidator<String>> listValidators = [];
    listValidators.add(
      FormBuilderValidators.required(),
    );
    if (validators != null && validators.isNotEmpty) {
      listValidators.addAll(validators);
    }

    return listValidators;
  }
}
