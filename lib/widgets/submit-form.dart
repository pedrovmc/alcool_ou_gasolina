import 'package:alcool_ou_gasolina/widgets/input.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var gasController = new MoneyMaskedTextController();
  var alcController = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitForm(
      {@required this.gasController,
      @required this.alcController,
      @required this.busy,
      @required this.submitFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            controller: gasController,
            label: "Gasolina",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            controller: alcController,
            label: "Álcool",
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          child: LoadingButton(
            busy: busy,
            func: submitFunc,
            text: "Calcular",
            invert: false,
          ),
        )
      ],
    );
  }
}
