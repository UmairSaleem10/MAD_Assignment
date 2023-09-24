import 'package:flutter/material.dart';

class ValidateForms extends StatefulWidget {
  const ValidateForms({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ValidateForms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form Validation'),
        ),
        body: const SafeArea(
          child: MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final Order _order = Order();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formStateKey,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Espresso',
                labelText: 'Item',
              ),
              validator: (value) => _validateItemRequired(value!),
              onSaved: (value) => _order.item = value,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: '3',
                labelText: 'Quantity',
              ),
              validator: (value) => _validateItemCount(value!),
              onSaved: (value) => _order.quantity = int.tryParse(value!),
            ),
            const Divider(
              height: 32.0,
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                if (_formStateKey.currentState!.validate()) {
                  _formStateKey.currentState?.save();
                  print('Order Item: ${_order.item}');
                  print('Order Quantity: ${_order.quantity}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Order {
  String? item;
  int? quantity;
}

// Mehods
String? _validateItemRequired(String value) {
  return value.isEmpty ? 'Item Required' : null;
}

String? _validateItemCount(String value) {
  int? _valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);
  return _valueAsInteger == 0 ? 'At least one Item is Required' : null;
}
