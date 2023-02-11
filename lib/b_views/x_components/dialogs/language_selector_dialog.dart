import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:video_translator/b_views/x_components/dialogs/bottom_dialog.dart';
import 'package:video_translator/services/helpers/helper_methods.dart';
import 'package:video_translator/services/navigation/navigators.dart';

Future<String> showLanguageDialog() async {

  String _output;

  final BuildContext context = getContext();
  final TextToSpeech tts = TextToSpeech();
  final List<String> _langs = await tts.getLanguages();

  await BottomDialog.showButtonsBottomDialog(
      context: context,
      draggable: true,
      numberOfWidgets: _langs.length,
    builder: (BuildContext xxx){

        return List.generate(_langs.length, (index){

          final String _lang = _langs[index];

          return BottomDialog.wideButton(
              context: context,
            height: 35,
            text: _lang,
            onTap: () async {

                _output = _lang;
                await Nav.goBack(context: context);

            }
          );

        });

    },
  );

  return _output;
}