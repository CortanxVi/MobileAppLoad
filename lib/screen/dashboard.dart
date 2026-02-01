import 'package:flutter/material.dart';
import 'package:mobilekakkak/theme/punk_theme.dart'; // Import Punk Theme
import 'package:mobilekakkak/theme/punk_widgets.dart';

class Device {
  final String name;
  final IconData icon;
  final Color color; // อาจจะไม่ใช้สีนี้แล้ว หรือใช้เป็น Accent แทน
  final String type;
  final bool isOn;
  final String? value;

  Device({
    required this.name,
    required this.icon,
    required this.color,
    required this.type,
    this.isOn = false,
    this.value,
  });
}

// ============================================================
// Dashboard Page (Punk Style)
// ============================================================
class DashboardPage extends StatefulWidget {
  final void Function(Device device) onDeviceTap;

  const DashboardPage({super.key, required this.onDeviceTap});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // ข้อมูล Device (เหมือนเดิม)
  final List<Device> devices = [
    Device(
      name: 'MAIN LIGHT',
      icon: Icons.lightbulb,
      color: Colors.orange,
      type: 'Light',
      isOn: true,
    ),
    Device(
      name: 'THERMOSTAT',
      icon: Icons.thermostat,
      color: Colors.blue,
      type: 'Climate',
      isOn: true,
      value: '24°C',
    ),
    Device(
      name: 'CAMERA 01',
      icon: Icons.videocam,
      color: Colors.red,
      type: 'Camera',
      isOn: true,
    ),
    Device(
      name: 'GATE LOCK',
      icon: Icons.lock,
      color: Colors.grey,
      type: 'Lock',
      isOn: false,
    ),
    Device(
      name: 'NET LINK',
      icon: Icons.router,
      color: Colors.green,
      type: 'Network',
      isOn: true,
      value: '5GHz',
    ),
    Device(
      name: 'AUDIO SYS',
      icon: Icons.speaker,
      color: Colors.purple,
      type: 'Audio',
      isOn: false,
    ),
    Device(
      name: 'PURIFIER',
      icon: Icons.air,
      color: Colors.teal,
      type: 'Appliance',
      isOn: true,
      value: 'Auto',
    ),
    Device(
      name: 'SMART TV',
      icon: Icons.tv,
      color: Colors.indigo,
      type: 'Entertainment',
      isOn: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(PunkSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. ใช้ PunkTextStyles
                Text(
                  'CONTROL CENTER',
                  style: PunkTextStyles.headline1.copyWith(fontSize: 28),
                ),
                const SizedBox(height: PunkSpacing.xs),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: PunkColors.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: PunkColors.primary, blurRadius: 5),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${devices.where((d) => d.isOn).length} SYSTEMS ONLINE',
                      style: PunkTextStyles.label.copyWith(
                        color: PunkColors.onBackground.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: PunkSpacing.sm),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: PunkSpacing.sm,
                mainAxisSpacing: PunkSpacing.sm,
                childAspectRatio: 1.0,
              ),
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return DeviceCard(
                  device: devices[index],
                  onTap: () => widget.onDeviceTap(devices[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Device Card (Punk Style)
// ============================================================
class DeviceCard extends StatelessWidget {
  final Device device;
  final VoidCallback onTap;

  const DeviceCard({super.key, required this.device, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // 2. ใช้ PunkBorders และ Effect
        decoration: device.isOn
            ? PunkBorders.primaryBorder.copyWith(
                color: PunkColors.surface,
              ) // Active
            : BoxDecoration(
                // Inactive
                color: PunkColors.surface.withOpacity(0.5),
                border: Border.all(
                  color: PunkColors.onBackground.withOpacity(0.1),
                ),
              ),
        child: Padding(
          padding: const EdgeInsets.all(PunkSpacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    device.icon,
                    // ถ้าเปิดใช้สี Primary (แดง), ถ้าปิดใช้สีขาวจางๆ
                    color: device.isOn
                        ? PunkColors.primary
                        : PunkColors.onBackground.withOpacity(0.5),
                    size: 32,
                  ),
                  if (device.isOn)
                    const Icon(
                      Icons.circle,
                      size: 8,
                      color: PunkColors.primary,
                    ),
                ],
              ),
              const Spacer(),
              Text(
                device.name,
                style: PunkTextStyles.bodyText.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                device.value ?? (device.isOn ? 'ONLINE' : 'OFFLINE'),
                style: PunkTextStyles.label.copyWith(
                  color: device.isOn
                      ? PunkColors.primary
                      : PunkColors.onBackground.withOpacity(0.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// Device Detail Page (Punk Style)
// ============================================================
class DeviceDetailPage extends StatefulWidget {
  final Device device;
  final VoidCallback onClose;

  const DeviceDetailPage({
    super.key,
    required this.device,
    required this.onClose,
  });

  @override
  State<DeviceDetailPage> createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {
  late bool isOn;
  double brightness = 0.7;
  double temperature = 24.0;

  @override
  void initState() {
    super.initState();
    isOn = widget.device.isOn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PunkColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: PunkColors.onBackground),
          onPressed: widget.onClose,
        ),
        title: Text(
          widget.device.type.toUpperCase(),
          style: PunkTextStyles.label,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PunkSpacing.md),
        child: Column(
          children: [
            // Icon Glow Effect
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isOn
                      ? PunkColors.primary
                      : PunkColors.onBackground.withOpacity(0.2),
                  width: 3,
                ),
                boxShadow: isOn ? PunkShadows.glow : [],
                color: PunkColors.surface,
              ),
              child: Icon(
                widget.device.icon,
                size: 64,
                color: isOn
                    ? PunkColors.primary
                    : PunkColors.onBackground.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: PunkSpacing.lg),

            Text(
              widget.device.name,
              style: PunkTextStyles.headline2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: PunkSpacing.xl),

            // Controls Container
            Container(
              padding: const EdgeInsets.all(PunkSpacing.md),
              decoration: PunkBorders.primaryBorder.copyWith(
                color: PunkColors.surface,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SYSTEM POWER', style: PunkTextStyles.bodyText),
                      Switch(
                        value: isOn,
                        onChanged: (value) => setState(() => isOn = value),
                        activeColor: PunkColors.primary,
                        activeTrackColor: PunkColors.primary.withOpacity(0.3),
                        inactiveThumbColor: PunkColors.onBackground,
                        inactiveTrackColor: PunkColors.background,
                      ),
                    ],
                  ),

                  if (widget.device.type == 'Light') ...[
                    const Divider(
                      color: PunkColors.primary,
                      thickness: 1,
                      height: 40,
                    ),
                    Text('OUTPUT LEVEL', style: PunkTextStyles.label),
                    const SizedBox(height: 10),
                    Slider(
                      value: brightness,
                      onChanged: isOn
                          ? (v) => setState(() => brightness = v)
                          : null,
                      activeColor: PunkColors.primary,
                      inactiveColor: PunkColors.onBackground.withOpacity(0.2),
                    ),
                  ],

                  if (widget.device.type == 'Climate') ...[
                    const Divider(
                      color: PunkColors.primary,
                      thickness: 1,
                      height: 40,
                    ),
                    Text('TARGET TEMP', style: PunkTextStyles.label),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: PunkColors.primary,
                          ),
                          onPressed: () => setState(() => temperature--),
                        ),
                        Text(
                          '${temperature.round()}°C',
                          style: PunkTextStyles.headline1,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: PunkColors.primary,
                          ),
                          onPressed: () => setState(() => temperature++),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: PunkSpacing.md),
            // ปุ่มแบบ PunkButton
            PunkButton(
              onPressed: () {},
              text: 'ADVANCED SETTINGS',
              isPrimary: false,
              icon: Icons.settings,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// Search Page (Punk Style)
// ============================================================
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(PunkSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('SEARCH DATABASE', style: PunkTextStyles.headline1),
            const SizedBox(height: PunkSpacing.md),
            // 3. ใช้ PunkTextField
            PunkTextField(
              controller: _searchController,
              obscureText: false,
              labelText: 'ENTER DEVICE ID...',
              prefixIcon: Icons.search,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// Automation Page (Punk Style)
// ============================================================
class AutomationPage extends StatelessWidget {
  const AutomationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(PunkSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AUTOMATION', style: PunkTextStyles.headline1),
            const SizedBox(height: PunkSpacing.xl),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: PunkColors.primary, width: 2),
                        boxShadow: PunkShadows.glow,
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        size: 60,
                        color: PunkColors.primary,
                      ),
                    ),
                    const SizedBox(height: PunkSpacing.md),
                    Text(
                      'NO ACTIVE SCRIPTS',
                      style: PunkTextStyles.bodyText.copyWith(
                        color: PunkColors.onBackground.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: PunkSpacing.lg),
                    PunkButton(onPressed: () {}, text: 'CREATE NEW RULE'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
