import 'package:flutter/material.dart';
import 'package:mobile_app/components/shipment_controller.dart';
import 'package:mobile_app/screen/navigation_screen/navigation_screen.dart';

class ShipmentScreen extends StatefulWidget {
  const ShipmentScreen({super.key});

  @override
  _ShipmentScreenState createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _shippingAddressController = TextEditingController();
  final _paymentDetailsController = TextEditingController();

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stepper(
            steps: _buildSteps(),
            currentStep: _currentStep,
            onStepContinue: _onStepContinue,
            onStepCancel: _onStepCancel,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              final isLastStep = _currentStep == _buildSteps().length - 1;
              return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                      ),
                      onPressed: () {
                        if (isLastStep) {
                          _onCreateOrder();
                        } else {
                          details.onStepContinue?.call();
                        }
                      },
                      child: Text(
                        isLastStep ? 'Create Order' : 'Continue',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                      ),
                      onPressed: details.onStepCancel,
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Create Order"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  List<Step> _buildSteps() {
    return [
      _buildStep(
          title: 'Name',
          content: _buildNameFields(),
          isActive: _currentStep >= 0),
      _buildStep(
          title: 'E-mail Field',
          content: _buildEmailField(),
          isActive: _currentStep >= 1),
      _buildStep(
          title: 'Phone Number',
          content: _buildPhoneField(),
          isActive: _currentStep >= 2),
      _buildStep(
          title: 'Order Information',
          content: _buildOrderInformation(),
          isActive: _currentStep >= 3),
      _buildStep(
          title: 'Shipping Information',
          content: _buildShippingInformation(),
          isActive: _currentStep >= 4),
      _buildStep(
          title: 'Payment Details',
          content: _buildPaymentDetails(),
          isActive: _currentStep >= 5),
      _buildStep(
          title: 'Finalize',
          content: _buildFinalizeStep(),
          isActive: _currentStep >= 6),
    ];
  }

  Step _buildStep(
      {required String title,
      required Widget content,
      required bool isActive}) {
    return Step(
      title: Text(title),
      content: content,
      isActive: isActive,
    );
  }

  Widget _buildNameFields() {
    return Column(
      children: [
        _buildTextField(controller: _firstnameController, label: 'First Name'),
        const SizedBox(height: 20),
        _buildTextField(controller: _lastnameController, label: 'Last Name'),
      ],
    );
  }

  Widget _buildEmailField() {
    return _buildTextField(
        controller: _emailController, label: 'Email Address');
  }

  Widget _buildPhoneField() {
    return _buildTextField(controller: _phoneController, label: 'Mobile');
  }

  Widget _buildOrderInformation() {
    return Column(
      children: [
        _buildTextField(label: 'Receiver Name'),
        const SizedBox(height: 20),
        _buildTextField(label: 'Order Date'),
        const SizedBox(height: 20),
        _buildDropdownField(
          label: 'Order Type',
          items: const ['Standard', 'Express', 'Pro'],
        ),
      ],
    );
  }

  Widget _buildShippingInformation() {
    return Column(
      children: [
        _buildTextField(
            controller: _shippingAddressController, label: 'Shipping Address'),
        const SizedBox(height: 20),
        _buildDropdownField(
          label: 'Package Size',
          items: const ['Up to 10kg', '10-20kg', '20-100kg', '100+kg'],
        ),
      ],
    );
  }

  Widget _buildPaymentDetails() {
    return _buildTextField(
        controller: _paymentDetailsController, label: 'Payment Details');
  }

  Widget _buildFinalizeStep() {
    return const Column(
      children: [
        Text('Review all details before submitting the order.',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Colors.red)),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTextField(
      {TextEditingController? controller, required String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdownField(
      {required String label, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        items: items
            .map((item) =>
                DropdownMenuItem<String>(value: item, child: Text(item)))
            .toList(),
        onChanged: (value) {},
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void _onStepContinue() {
    final isLastStep = _currentStep == _buildSteps().length - 1;
    if (!isLastStep) {
      setState(() {
        _currentStep = (_currentStep + 1).clamp(0, _buildSteps().length - 1);
      });
    } else {
      _onCreateOrder();
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep = (_currentStep - 1).clamp(0, _buildSteps().length - 1);
      });
    }
  }

  void _onCreateOrder() {
    final orderData = {
      'receiver_name':
          '${_firstnameController.text} ${_lastnameController.text}',
      'order_type': 'Standard',
      'shipping_address': _shippingAddressController.text,
      'package_size': 'Up to 10kg',
      'package_weight': '1kg',
      'delivery_instructions': '',
      'terms_and_conditions': true,
    };

    sendOrderData(orderData);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Created!'),
          content: const Text('Order Successfully Created 😃'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationScreen()));
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
