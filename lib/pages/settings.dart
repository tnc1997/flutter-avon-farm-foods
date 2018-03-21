import 'package:avon_farm_foods/enums/theme.dart';
import 'package:avon_farm_foods/models/configuration.dart';
import 'package:avon_farm_foods/widgets/drawer.dart';
import 'package:avon_farm_foods/widgets/form_section_divider.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage(this.configuration, this.updater);

  final Configuration configuration;
  final ValueChanged<Configuration> updater;

  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AppBar _buildAppBar() {
    return new AppBar(
      title: new Text('Settings'),
    );
  }

  ListView _buildSettingsList() {
    return new ListView(
      children: <Widget>[
        new FormSectionDividerWidget(title: 'Theme'),
        _buildThemeRadioListTile('Dark', AppTheme.dark),
        _buildThemeRadioListTile('Light', AppTheme.light),
      ],
    );
  }

  RadioListTile<AppTheme> _buildThemeRadioListTile(
    String title,
    AppTheme value,
  ) {
    return new RadioListTile<AppTheme>(
      groupValue: widget.configuration.theme,
      onChanged: _handleThemeChanged,
      title: new Text(title),
      value: value,
    );
  }

  void _handleThemeChanged(AppTheme theme) {
    widget.updater(widget.configuration.copyWith(theme: theme));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildSettingsList(),
      drawer: new DrawerWidget(),
    );
  }
}
