import 'package:flutter/material.dart';
import 'package:mobile_app/components/sql_helper.dart';
import 'package:mobile_app/screen/navigation_screen/navigation_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<Map<String, dynamic>> _orders = [];
  bool _isLoading = true;

  void _refreshOrders() async {
    final data = await SQLHelper.getOrders();
    setState(() {
      _orders = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshOrders();
  }

  final TextEditingController _orderNumberController = TextEditingController();
  final TextEditingController _receiverNameController = TextEditingController();
  final TextEditingController _receiverAddressController =
      TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  Future<void> _addOrder() async {
    String uniqueOrderNumber = 'ORD${_orders.length + 1}';

    await SQLHelper.createOrder(
      uniqueOrderNumber,
      _receiverNameController.text,
      _receiverAddressController.text,
      _mobileNumberController.text,
    );
    _refreshOrders();
    print("..number of orders: ${_orders.length} ");
  }

  Future<void> _updateOrder(int id) async {
    await SQLHelper.updateOrder(
      id,
      _orderNumberController.text,
      _receiverNameController.text,
      _receiverAddressController.text,
      _mobileNumberController.text,
    );
    _refreshOrders();
  }

  void _deleteOrder(int id) async {
    await SQLHelper.deleteOrder(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully deleted!'),
      ),
    );
    _refreshOrders();
  }

  void _showForm(int? id) async {
    if (id != null) {
      final existingOrder =
          _orders.firstWhere((element) => element['id'] == id);
      _orderNumberController.text = existingOrder['orderNumber'];
      _receiverNameController.text = existingOrder['receiverName'];
      _receiverAddressController.text = existingOrder['receiverAddress'];
      _mobileNumberController.text = existingOrder['mobileNumber'];
    } else {
      _orderNumberController.clear();
      _receiverNameController.clear();
      _receiverAddressController.clear();
      _mobileNumberController.clear();
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 150,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            _buildTextField(_orderNumberController, "Order Number",
                Icons.confirmation_number),
            const SizedBox(height: 15),
            _buildTextField(
                _receiverNameController, "Receiver Name", Icons.person),
            const SizedBox(height: 15),
            _buildTextField(
                _receiverAddressController, "Receiver Address", Icons.home),
            const SizedBox(height: 15),
            _buildTextField(
                _mobileNumberController, "Mobile Number", Icons.phone),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _addOrder();
                } else {
                  await _updateOrder(id);
                }
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Text(
                id == null ? 'Create' : 'Update',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hintText, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavigationScreen()));
          },
        ),
        title: const Text("Order History"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (context, index) => Card(
                color: const Color(0xFFf0f4f8),
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(
                    "Order Number: ${_orders[index]['orderNumber']}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Receiver Name: ${_orders[index]['receiverName']}"),
                      Text(
                          "Receiver Address: ${_orders[index]['receiverAddress']}"),
                      Text("Mobile Number: ${_orders[index]['mobileNumber']}"),
                      Text("Order Date: ${_orders[index]['orderDate']}"),
                    ],
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => _showForm(_orders[index]['id']),
                          icon: const Icon(Icons.edit, color: Colors.green),
                        ),
                        IconButton(
                          onPressed: () => _deleteOrder(_orders[index]['id']),
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
