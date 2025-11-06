
Title
Flutter Calculator (Beginner Friendly)

Description
A simple, clean Flutter calculator that supports addition, subtraction, multiplication, and division. The UI is styled with Material 3 theming, safe number parsing, a divide‑by‑zero guard, and a one‑tap clear action for a smooth experience.

Features
- Two input fields with styled InputDecoration and helpful icons.
- Result panel with bold typography and subtle background for focus.
- Four operation buttons (+, −, ×, ÷) arranged in a responsive Wrap; FloatingActionButton extended for Clear.
- Reusable widgets for inputs (CalculatorDisplay) and actions (_CalcFab) to keep code clean.

Project structure
- lib/app/app.dart — MaterialApp + global Material 3 theme.
- lib/view/home_view.dart — AppBar + SafeArea wrapper.
- lib/view/calculator_view.dart — Calculator UI and business logic.
- test/widget_test.dart — Basic widget test template (optional).

Getting started
- flutter pub get  
- flutter run

Tech stack
- Flutter 3.x, Dart, Material + Cupertino icons, Material 3 theming.
