import 'package:alcool_ou_gasolina/widgets/logo.widget.dart';
import 'package:alcool_ou_gasolina/widgets/submit-form.dart';
import 'package:alcool_ou_gasolina/widgets/sucess.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color;
  var _gasController = new MoneyMaskedTextController();
  var _alcController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa usar Álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: (Duration(milliseconds: 1200)),
          color: _color,
          child: ListView(
            children: <Widget>[
              Logo(),
              _completed
                  ? Sucess(
                      reset: reset,
                      result: _resultText,
                    )
                  : SubmitForm(
                      alcController: _alcController,
                      gasController: _gasController,
                      busy: _busy,
                      submitFunc: calculate,
                    ),
            ],
          ),
        ));
  }

  Future calculate() {
    double alc =
        double.parse(_alcController.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;
    double gas =
        double.parse(_gasController.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;
    double res = alc / gas;
    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina";
        } else {
          _resultText = "Compensa utilizar Álcool";
        }
        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _alcController = new MoneyMaskedTextController();
      _gasController = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
