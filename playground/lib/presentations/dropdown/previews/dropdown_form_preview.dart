import 'package:flutter/material.dart' hide Card;

import '../../../config/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';
import '../../../widgets/dropdown.dart';

/// Preview for dropdown in a form context.
class DropdownFormPreview extends StatefulWidget {
  const DropdownFormPreview({super.key});

  @override
  State<DropdownFormPreview> createState() => _DropdownFormPreviewState();
}

class _DropdownFormPreviewState extends State<DropdownFormPreview> {
  String? _selectedCountry;
  String? _selectedState;
  String? _selectedCity;
  bool _submitted = false;

  final List<DropdownItem<String>> _countries = const [
    DropdownItem(value: 'us', label: 'United States', icon: Icons.flag),
    DropdownItem(value: 'ca', label: 'Canada', icon: Icons.flag),
    DropdownItem(value: 'uk', label: 'United Kingdom', icon: Icons.flag),
  ];

  final Map<String, List<DropdownItem<String>>> _states = const {
    'us': [
      DropdownItem(value: 'ca', label: 'California'),
      DropdownItem(value: 'ny', label: 'New York'),
      DropdownItem(value: 'tx', label: 'Texas'),
    ],
    'ca': [
      DropdownItem(value: 'on', label: 'Ontario'),
      DropdownItem(value: 'qc', label: 'Quebec'),
      DropdownItem(value: 'bc', label: 'British Columbia'),
    ],
    'uk': [
      DropdownItem(value: 'eng', label: 'England'),
      DropdownItem(value: 'sco', label: 'Scotland'),
      DropdownItem(value: 'wal', label: 'Wales'),
    ],
  };

  final Map<String, List<DropdownItem<String>>> _cities = const {
    'ca': [
      DropdownItem(value: 'la', label: 'Los Angeles'),
      DropdownItem(value: 'sf', label: 'San Francisco'),
      DropdownItem(value: 'sd', label: 'San Diego'),
    ],
    'ny': [
      DropdownItem(value: 'nyc', label: 'New York City'),
      DropdownItem(value: 'buf', label: 'Buffalo'),
      DropdownItem(value: 'roc', label: 'Rochester'),
    ],
    'tx': [
      DropdownItem(value: 'hou', label: 'Houston'),
      DropdownItem(value: 'dal', label: 'Dallas'),
      DropdownItem(value: 'aus', label: 'Austin'),
    ],
    'on': [
      DropdownItem(value: 'tor', label: 'Toronto'),
      DropdownItem(value: 'ott', label: 'Ottawa'),
      DropdownItem(value: 'mis', label: 'Mississauga'),
    ],
    'qc': [
      DropdownItem(value: 'mon', label: 'Montreal'),
      DropdownItem(value: 'que', label: 'Quebec City'),
      DropdownItem(value: 'gat', label: 'Gatineau'),
    ],
    'bc': [
      DropdownItem(value: 'van', label: 'Vancouver'),
      DropdownItem(value: 'vic', label: 'Victoria'),
      DropdownItem(value: 'kel', label: 'Kelowna'),
    ],
    'eng': [
      DropdownItem(value: 'lon', label: 'London'),
      DropdownItem(value: 'man', label: 'Manchester'),
      DropdownItem(value: 'bir', label: 'Birmingham'),
    ],
    'sco': [
      DropdownItem(value: 'edi', label: 'Edinburgh'),
      DropdownItem(value: 'gla', label: 'Glasgow'),
      DropdownItem(value: 'abe', label: 'Aberdeen'),
    ],
    'wal': [
      DropdownItem(value: 'car', label: 'Cardiff'),
      DropdownItem(value: 'swa', label: 'Swansea'),
      DropdownItem(value: 'new', label: 'Newport'),
    ],
  };

  void _handleCountryChange(String? value) {
    setState(() {
      _selectedCountry = value;
      _selectedState = null;
      _selectedCity = null;
    });
  }

  void _handleStateChange(String? value) {
    setState(() {
      _selectedState = value;
      _selectedCity = null;
    });
  }

  void _handleSubmit() {
    setState(() => _submitted = true);
    if (_selectedCountry != null &&
        _selectedState != null &&
        _selectedCity != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Form submitted successfully!',
            style: TextStyle(color: AppTheme.white),
          ),
          backgroundColor: AppTheme.success,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasCountryError = _submitted && _selectedCountry == null;
    final hasStateError = _submitted && _selectedState == null;
    final hasCityError = _submitted && _selectedCity == null;

    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: SingleChildScrollView(
          padding: AppTheme.padding2xl,
          child: Card(
            child: Padding(
              padding: AppTheme.padding2xl,
              child: SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Location Information',
                      style: AppTheme.headlineMedium.copyWith(
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    AppTheme.gapVerticalSm,
                    Text(
                      'Please select your location details',
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeSm,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    AppTheme.gapVertical2xl,
                    Dropdown<String>(
                      label: 'Country',
                      description: 'Select your country',
                      placeholder: 'Choose a country',
                      value: _selectedCountry,
                      items: _countries,
                      onChanged: _handleCountryChange,
                      error: hasCountryError,
                      errorText: hasCountryError ? 'Country is required' : null,
                    ),
                    AppTheme.gapVerticalXl,
                    Dropdown<String>(
                      label: 'State/Province',
                      description: 'Select your state or province',
                      placeholder: _selectedCountry == null
                          ? 'Select country first'
                          : 'Choose a state',
                      value: _selectedState,
                      items: _selectedCountry != null
                          ? _states[_selectedCountry]!
                          : [],
                      onChanged: _handleStateChange,
                      disabled: _selectedCountry == null,
                      error: hasStateError,
                      errorText: hasStateError
                          ? 'State/Province is required'
                          : null,
                    ),
                    AppTheme.gapVerticalXl,
                    Dropdown<String>(
                      label: 'City',
                      description: 'Select your city',
                      placeholder: _selectedState == null
                          ? 'Select state first'
                          : 'Choose a city',
                      value: _selectedCity,
                      items: _selectedState != null
                          ? _cities[_selectedState]!
                          : [],
                      onChanged: (value) =>
                          setState(() => _selectedCity = value),
                      disabled: _selectedState == null,
                      error: hasCityError,
                      errorText: hasCityError ? 'City is required' : null,
                    ),
                    AppTheme.gapVertical3xl,
                    Button(
                      onPressed: _handleSubmit,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
