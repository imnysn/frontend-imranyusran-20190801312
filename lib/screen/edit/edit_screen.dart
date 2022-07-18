import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:uas/model/dosen.dart';
import 'package:uas/screen/dosen_viewmodel.dart';
import 'package:uas/screen/edit/components/default_dropdown_widget.dart';
import 'package:uas/screen/edit/components/default_textfield_widget.dart';
import 'package:uas/utils/app_route.dart';
import 'package:uas/utils/context_ext.dart';

class EditScreen extends StatefulWidget {
  final Dosen? dosen;
  const EditScreen({Key? key, this.dosen}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            widget.dosen != null ? 'Edit Data' : 'Add Data',
            style: const TextStyle(color: Colors.black),
          )),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultTextFieldWdiget(
                        id: 'name',
                        labelText: 'Name',
                        initialValue: widget.dosen?.nama,
                      ),
                      DefaultDropdownWidget(
                        id: 'rumpun',
                        items: _getListFakultas(),
                        labelText: 'Fakultas',
                        initialValue: widget.dosen?.fakultas,
                      ),
                      DefaultDropdownWidget(
                        id: 'progStud',
                        items: _getListProdi(),
                        labelText: 'Program Studi',
                        initialValue: widget.dosen?.prodi,
                      ),
                      DefaultTextFieldWdiget(
                        id: 'email',
                        labelText: 'Email',
                        validators: [FormBuilderValidators.email()],
                        initialValue: widget.dosen?.email,
                      )
                    ],
                  )),
              Expanded(
                  child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => _onClick(context),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      child: const Text('Submit'),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  _onClick(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final dosen = widget.dosen;
      final rng = Random();
      var value = _formKey.currentState!.value;
      var name = value['name'];
      var rumpun = value['rumpun'];
      var programStudy = value['progStud'];
      var email = value['email'];
      var newDosen = Dosen(
          id: 7,
          dosenid: 'Dosen00${rng.nextInt(100)}',
          nama: name,
          fakultas: rumpun,
          prodi: programStudy,
          email: email);

      if (dosen != null) {
        newDosen.id = dosen.id;
        newDosen.dosenid = dosen.dosenid;
      }

      if (dosen == null) {
        context.read<DosenViewModel>().addDosen(newDosen);
      } else {
        context.read<DosenViewModel>().updateDosen(newDosen);
      }
      context.snackbar.showSnackBar(const SnackBar(content: Text('Sukses')));
      AppRoute.back();
    }
  }

  _getListFakultas() => ["Ilmu Komputer", 'Ilmu Komunikasi', 'Ekonomi Bisnis'];

  _getListProdi() => ["Teknik Informatika", 'Markom', 'Manajemen Bisnis'];
}
