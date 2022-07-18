import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DefaultDropdownWidget extends StatelessWidget {
  final String id;
  final List<String> items;
  final String labelText;
  final String? initialValue;
  const DefaultDropdownWidget(
      {Key? key,
      required this.id,
      required this.items,
      required this.labelText,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? Container()
        : FormBuilderDropdown(
            name: id,
            items: items
                .map((item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item)))
                .toList(),
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required()]),
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
          );
  }
}
