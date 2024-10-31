import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  @override
  _BatteryScreenState createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  final Battery _battery = Battery();
  int _batteryLevel = 0;
  String _batteryMessage = '';

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  Future<void> _getBatteryLevel() async {
    final level = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = level;
      _setBatteryMessage(level);
    });
  }

  void _setBatteryMessage(int level) {
    if (level < 30) {
      _batteryMessage = 'Battery is low! Please charge soon ⚠️🔋';
    } else if (level >= 30 && level < 90) {
      _batteryMessage =
          'Battery level is okay for now, but keep an eye on it! 😊🔋';
    } else if (level >= 90) {
      _batteryMessage =
          'Battery is almost full! You can unplug soon if needed 🔌😊';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Battery')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Battery Level: $_batteryLevel%',
                style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text(
              _batteryMessage,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
