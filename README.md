# country_code_manager

[![Pub Version](https://img.shields.io/pub/v/country_code_manager.svg?style=flat-square)](https://pub.dev/packages/country_code_manager_manager)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

A Flutter package to simplify the use of country codes, names, and flags in your applications.

## Features


<img src="https://raw.githubusercontent.com/mrjake34/country_code_manager/main/screenshots/ss1.png" width="240"/>
<img src="https://raw.githubusercontent.com/mrjake34/country_code_manager/main/screenshots/ss2.png" width="240"/>
<img src="https://raw.githubusercontent.com/mrjake34/country_code_manager/main/screenshots/ss3.png" width="240"/>

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

## Usage

### Initialization

Initialize the CountryCodeManager in your app's initialization process:

```dart
  await CountryCodeManager.instance.init();
```

### Displaying Country Flags

Use the ShowFlag widget to display a flag for a specific country code:

```dart
ShowFlag(countryCode: 'US') // Displays the flag for the United States
```

Customization:

Flag Size: Adjust width and height properties of the ShowFlag widget.
Fit: Use the fit property to control how the flag image fits within the widget.

### Country Dial Code Selection Widget

Display a PopupMenuButton for users to select a dial code:

```dart
ShowDialCode(
  initialValue: '', ///Set a initial value
  onSelected: (value) {
    debugPrint(value);
  },
),
```

### Country Selection Widget (ShowCountries)

Display a bottom sheet modal for users to select a country:

```dart
Country? selectedCountry = await ShowCountries.show(context);
if (selectedCountry != null) {
  // Handle the selected country (e.g., print its name)
  print(selectedCountry.name);
}
```

Customization:

showFlag: Whether to display the country flag (default: true).
showName: Whether to display the country name (default: true).
showDialCode: Whether to display the country's dial code (default: true).
shape: Customize the shape of the list tiles (e.g., RoundedRectangleBorder).

### Country Selection Dropdown (Alternative)

You can also use a DropdownButton for country selection:

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



### Localization (Optional)

To use localized country names, provide the language parameter during initialization:

```dart
await CountryCodeManager.instance.init(Locale('en')); // English
```

Supported Languages:

[af, al, dz, as, ad, ao, ai, aq, ag, ar, am, aw, au, at, az, bs, bh, bd, bb, by, be, bz, bj, bm, bt, bo, ba, bw, bv, br, io, bn, bg, bf, bi, kh, cm, ca, cv, ky, cf, td, cl, cn, cx, cc, co, km, cg, cd, ck, cr, ci, hr, cu, cy, cz, dk, dj, dm, do, ec, eg, sv, gq, er, ee, et, fk, fo, fj, fi, fr, gf, pf, tf, ga, gm, ge, de, gh, gi, gr, gl, gd, gp, gu, gt, gn, gw, gy, ht, hm, va, hn, hk, hu, is, in, id, ir, iq, ie, il, it, jm, jp, jo, kz, ke, ki, kp, kr, kw, kg, la, lv, lb, ls, lr, ly, li, lt, lu, mo, mg, mw, my, mv, ml, mt, mh, mq, mr, mu, yt, mx, fm, md, mc, mn, ms, ma, mz, mm, na, nr, np, nl, nc, nz, ni, ne, ng, nu, nf, mk, mp, no, om, pk, pw, ps, pa, pg, py, pe, ph, pn, pl, pt, pr, qa, re, ro, ru, rw, sh, kn, lc, pm, vc, ws, sm, st, sa, sn, sc, sl, sg, sk, si, sb, so, za, gs, es, lk, sd, sr, sj, sz, se, ch, sy, tw, tj, tz, th, tl, tg, tk, to, tt, tn, tr, tm, tc, tv, ug, ua, ae, gb, us, um, uy, uz, vu, ve, vn, vg, vi, wf, eh, ye, zm, zw, ax, bq, cw, gg, im, je, me, bl, mf, rs, sx, ss, xk]


Flags and Localization files from https://pub.dev/packages/country_code_picker