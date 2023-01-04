import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:widgetbook/widgetbook.dart';

import 'core/init/notifier/provider_list.dart';
import 'core/init/theme/app_theme_dark.dart';
import 'core/init/theme/app_theme_light.dart';
import 'core/widget/base_checkbox.dart';
import 'core/widget/base_chip.dart';
import 'core/widget/base_circle_avatar.dart';
import 'core/widget/base_elevated_button.dart';
import 'core/widget/base_elevated_icon_button.dart';
import 'core/widget/base_floating_action_button.dart';
import 'core/widget/base_form.dart';
import 'core/widget/base_form_input.dart';
import 'core/widget/base_radio_button.dart';
import 'core/widget/base_text_area.dart';
import 'core/widget/base_toggle_switch.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool _enable = false;

  Future<void> promiseToFuture() async {
    await Future.delayed(Duration(seconds: 2), () {
      return null;
    });
  }

  void toggleTheme(
    WidgetRef ref,
  ) {
    ref.read(themeNotifierProvider.notifier).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'Components',
          widgets: [
            WidgetbookComponent(
              name: 'Button',
              useCases: [
                WidgetbookUseCase(
                    name: 'Elevated Icon Button',
                    builder: (context) => Center(
                        child: BaseElevatedIconButton(
                            title: 'Label',
                            onTap: () {
                              return promiseToFuture();
                            },
                            icon: CupertinoIcons.add))),
                WidgetbookUseCase(
                  name: 'Elevated Button',
                  builder: (context) => Center(
                      child: BaseElevatedButton(
                          onTap: () {
                            return promiseToFuture();
                          },
                          title: 'Label')),
                ),
                WidgetbookUseCase(
                  name: 'Floating Action Button',
                  builder: (context) => Center(
                    child: BaseFloatingActionButton(
                        onTap: () async {
                          return promiseToFuture();
                        },
                        icon: CupertinoIcons.add),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Check box list tile',
                  builder: (context) => const BaseCheckBox(),
                ),
                WidgetbookUseCase(
                  name: 'Radio Button',
                  builder: (context) => const BaseRadioButton(),
                ),
                WidgetbookUseCase(
                  name: 'Cupertino Switch Button',
                  builder: (context) => Center(
                    child: BaseSwitch(
                      value: _enable,
                      onChanged: (bool value) {
                        setState(() {
                          _enable = value;
                        });
                      },
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Chip',
                  builder: (context) => BaseChip(),
                ),
                WidgetbookUseCase(
                  name: 'Text Input',
                  builder: (context) => Padding(
                    padding: context.horizontalPaddingNormal,
                    child: BaseFormInput(
                      label: 'label',
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Circle Avatar',
                  builder: (context) => const BaseCircleAvatar(),
                ),
                WidgetbookUseCase(
                  name: 'Base Text Area',
                  builder: (context) => Padding(
                    padding: context.horizontalPaddingNormal,
                    child: const BaseTextArea(),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Base Form',
                  builder: (context) => const BaseForm(),
                ),
              ],
            ),
          ],
        ),
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: AppThemeLight.instance.theme,
        ), // dummy theme
        WidgetbookTheme(
          name: 'Dark',
          data: AppThemeDark.instance.darkTheme,
        ),
      ],
      appInfo: AppInfo(name: 'Lefine App'),
    );
  }
}
