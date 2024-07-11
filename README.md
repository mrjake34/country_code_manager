# country_code_manager_manager 

[![Pub Version](https://img.shields.io/pub/v/country_code_manager.svg?style=flat-square)](https://pub.dev/packages/country_code_manager_manager)
[![style: very good analysis][badge]][badge_link]

A Flutter package to simplify the use of country codes, names, and flags in your applications.

## Features

* **Easy Country Selection:** Provides a convenient widget for selecting countries from a list.
* **Customizable:** Adjust flag size, display format, and other properties.
* **Localized Country Names:** Supports multiple languages for displaying country names.
* **Asset Integration:** Seamlessly integrates with your app's assets for flag images.

## Installation

Add the `country_code_manager` package to your `pubspec.yaml` file:

```yaml
dependencies:
  country_code_manager: ^latest_version
```

Usage

Initialization

Initialize the CountryCodeManager in your app's initialization process:

```dart
  await CountryCodeManager.instance.init();
```

Displaying Country Flags

Use the ShowFlag widget to display a flag for a specific country code:

```dart
ShowFlag(countryCode: 'US') // Displays the flag for the United States
```

Country Selection Widget

Create a dropdown or other interactive widget to allow users to select a country:


```dart
DropdownButton<String>(
  items: CountryCodeManager.instance.countries.map((Country country) {
    return DropdownMenuItem<String>(
      value: country.code,
      child: Row(
        children: [
          ShowFlag(countryCode: country.code, width: 24),
          SizedBox(width: 8),
          Text(country.name),
        ],
      ),
    );
  }).toList(),
  onChanged: (value) {
    // Handle country selection
  },
)
```

Localization (Optional)

To use localized country names, provide the language parameter during initialization:

```dart
await CountryCodeManager.instance.init(SupportedLanguage.en); // English
```

Supported Languages:

English (en)
Customization

Flag Size: Adjust width and height properties of the ShowFlag widget.
Fit: Use the fit property to control how the flag image fits within the widget.
Add More Languages: Expand the SupportedLanguage enum and add corresponding JSON files in the locale folder.