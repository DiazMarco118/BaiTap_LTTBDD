import 'package:flutter/material.dart';
import 'screens/text_detail_screen.dart';
import 'screens/images_detail_screen.dart';
import 'screens/textfield_detail_screen.dart';
import 'screens/passwordfield_detail_screen.dart';
import 'screens/column_detail_screen.dart';
import 'screens/row_detail_screen.dart';
import 'screens/box_detail_screen.dart';
import 'screens/checkbox_detail_screen.dart';
import 'screens/radio_button_detail_screen.dart';
import 'screens/slider_detail_screen.dart';
import 'screens/chips_detail_screen.dart';
import 'screens/menus_detail_screen.dart';
import 'screens/switch_detail_screen.dart';
import 'screens/time_picker_detail_screen.dart';
import 'screens/bottom_sheets_detail_screen.dart';
import 'screens/cards_detail_screen.dart';
import 'screens/carousel_detail_screen.dart';
import 'screens/dialogs_detail_screen.dart';
import 'screens/dividers_detail_screen.dart';
import 'screens/badges_detail_screen.dart';
import 'screens/progress_indicators_detail_screen.dart';
import 'screens/snackbar_detail_screen.dart';
import 'screens/tooltips_detail_screen.dart';
import 'screens/buttons_detail_screen.dart';
import 'screens/floating_action_button_detail_screen.dart';
import 'screens/icon_button_detail_screen.dart';
import 'screens/segmented_button_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Components',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 40),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Jetpack Compose Logo
                    Image.asset(
                      'assets/jetpack_compose.png',
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Jetpack Compose',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ComponentsListScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "I'm ready",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComponentsListScreen extends StatelessWidget {
  const ComponentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'UI Components List',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildComponentCategory('Display', [
            _buildComponentItem('Text', 'Displays text', context),
            _buildComponentItem('Image', 'Displays an image', context),
          ]),
          const SizedBox(height: 24),
          _buildComponentCategory('Input', [
            _buildComponentItem('TextField', 'Input field for text', context),
            _buildComponentItem(
              'PasswordField',
              'Input field for passwords',
              context,
            ),
          ]),
          const SizedBox(height: 24),
          _buildComponentCategory('Layout', [
            _buildComponentItem(
              'Column',
              'Arranges elements vertically',
              context,
            ),
            _buildComponentItem(
              'Row',
              'Arranges elements horizontally',
              context,
            ),
            _buildComponentItem(
              'Box',
              'Container for grouping elements',
              context,
            ),
          ]),
          const SizedBox(height: 24),
          _buildComponentCategory('Selection', [
            _buildComponentItem(
              'Checkbox',
              'Selection from list or toggle',
              context,
            ),
            _buildComponentItem(
              'Radio button',
              'Select one from options',
              context,
            ),
            _buildComponentItem('Slider', 'Select value from range', context),
            _buildComponentItem('Chips', 'Input, filter or selection', context),
            _buildComponentItem('Menus', 'Display list of choices', context),
            _buildComponentItem(
              'Switch',
              'Toggle selection on or off',
              context,
            ),
            _buildComponentItem(
              'Time pickers',
              'Select specific time',
              context,
            ),
          ]),
          const SizedBox(height: 24),
          _buildComponentCategory('Containment', [
            _buildComponentItem(
              'Bottom sheets',
              'Show secondary content',
              context,
            ),
            _buildComponentItem(
              'Cards',
              'Display content about single subject',
              context,
            ),
            _buildComponentItem(
              'Carousel',
              'Scrollable collection of items',
              context,
            ),
            _buildComponentItem(
              'Dialogs',
              'Provide important prompts',
              context,
            ),
            _buildComponentItem('Dividers', 'Group content in lists', context),
          ]),
          const SizedBox(height: 24),
          _buildComponentCategory('Communication', [
            _buildComponentItem(
              'Badges',
              'Show notifications and counts',
              context,
            ),
            _buildComponentItem(
              'Progress indicators',
              'Display wait time or duration',
              context,
            ),
            _buildComponentItem('Snackbar', 'Show short app updates', context),
            _buildComponentItem(
              'Tooltips',
              'Display brief labels or messages',
              context,
            ),
          ]),
          const SizedBox(height: 24),
          _buildComponentCategory('Actions', [
            _buildComponentItem(
              'Buttons',
              'Prompt most actions in a UI',
              context,
            ),
            _buildComponentItem(
              'Floating action button',
              'Help users take primary actions',
              context,
            ),
            _buildComponentItem(
              'Icon button',
              'Take minor actions with one tap',
              context,
            ),
            _buildComponentItem(
              'Segmented button',
              'Select options or sort elements',
              context,
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildComponentCategory(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        ...items,
      ],
    );
  }

  Widget _buildComponentItem(
    String name,
    String description,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        if (name == 'Text') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TextDetailScreen()),
          );
        } else if (name == 'Image') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ImagesDetailScreen()),
          );
        } else if (name == 'TextField') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TextFieldDetailScreen(),
            ),
          );
        } else if (name == 'PasswordField') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PasswordFieldDetailScreen(),
            ),
          );
        } else if (name == 'Column') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ColumnDetailScreen()),
          );
        } else if (name == 'Row') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RowDetailScreen()),
          );
        } else if (name == 'Box') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BoxDetailScreen()),
          );
        } else if (name == 'Checkbox') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckboxDetailScreen(),
            ),
          );
        } else if (name == 'Radio button') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RadioButtonDetailScreen(),
            ),
          );
        } else if (name == 'Slider') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SliderDetailScreen()),
          );
        } else if (name == 'Chips') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChipsDetailScreen()),
          );
        } else if (name == 'Menus') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MenusDetailScreen()),
          );
        } else if (name == 'Switch') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SwitchDetailScreen()),
          );
        } else if (name == 'Time pickers') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TimePickerDetailScreen(),
            ),
          );
        } else if (name == 'Bottom sheets') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomSheetsDetailScreen(),
            ),
          );
        } else if (name == 'Cards') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CardsDetailScreen()),
          );
        } else if (name == 'Carousel') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CarouselDetailScreen(),
            ),
          );
        } else if (name == 'Dialogs') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DialogsDetailScreen(),
            ),
          );
        } else if (name == 'Dividers') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DividersDetailScreen(),
            ),
          );
        } else if (name == 'Badges') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BadgesDetailScreen()),
          );
        } else if (name == 'Progress indicators') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProgressIndicatorsDetailScreen(),
            ),
          );
        } else if (name == 'Snackbar') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SnackbarDetailScreen(),
            ),
          );
        } else if (name == 'Tooltips') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TooltipsDetailScreen(),
            ),
          );
        } else if (name == 'Buttons') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ButtonsDetailScreen(),
            ),
          );
        } else if (name == 'Floating action button') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FloatingActionButtonDetailScreen(),
            ),
          );
        } else if (name == 'Icon button') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const IconButtonDetailScreen(),
            ),
          );
        } else if (name == 'Segmented button') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SegmentedButtonDetailScreen(),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(description),
          trailing: const Icon(Icons.chevron_right, color: Color(0xFF2196F3)),
        ),
      ),
    );
  }
}
