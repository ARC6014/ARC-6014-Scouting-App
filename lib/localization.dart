import 'dart:collection';

import 'package:flutter/material.dart';


HashMap<String, HashMap<Language, String>> local = HashMap.from({
    'Team': HashMap<Language, String>.from({
        Language.tr: 'Takım',
    }),
    'English': HashMap<Language, String>.from({
        Language.tr: 'İngilizce',
    }),
    'Turkish': HashMap<Language, String>.from({
        Language.tr: 'Türkçe',
    }),
    'Start the timer': HashMap<Language, String>.from({
        Language.tr: 'Sayacı başlat',
    }),
    'End the timer': HashMap<Language, String>.from({
        Language.tr: 'Sayacı bitir',
    }),
    'Team Number': HashMap<Language, String>.from({
        Language.tr: 'Takım numarası',
    }),
    'Driver Station Color': HashMap<Language, String>.from({
        Language.tr: 'Sürücü İstasyonu Rengi',
    }),
    'Driver Station Alignment': HashMap<Language, String>.from({
        Language.tr: 'Sürücü İstasyonu Hizası',
    }),
    'Left': HashMap<Language, String>.from({
        Language.tr: 'Sol',
    }),
    'Middle': HashMap<Language, String>.from({
        Language.tr: 'Orta',
    }),
    'Right': HashMap<Language, String>.from({
        Language.tr: 'Sağ',
    }),
    'Cargo Placement': HashMap<Language, String>.from({
        Language.tr: 'Kargo Alımı',
    }),
    'Take cargo': HashMap<Language, String>.from({
        Language.tr: 'Kargo al',
    }),
    'Place cargo': HashMap<Language, String>.from({
        Language.tr: 'Kargo bırak',
    }),
    'Hatch Placement': HashMap<Language, String>.from({
        Language.tr: 'Kapak alımı',
    }),
    'Take hatch': HashMap<Language, String>.from({
        Language.tr: 'Kapak al',
    }),
    'Place hatch': HashMap<Language, String>.from({
        Language.tr: 'Kapak bırak',
    }),
    'Hab Climb Time': HashMap<Language, String>.from({
        Language.tr: 'Hab tırmanma süresi',
    }),
    'Start the counter': HashMap<Language, String>.from({
        Language.tr: 'Sayacı başlat',
    }),
    'End the counter': HashMap<Language, String>.from({
        Language.tr: 'Sayacı bitir',
    }),
    'Hab Start Level': HashMap<Language, String>.from({
        Language.tr: 'Hab Başlangıç Bölümü',
    }),
    'Hab End Level': HashMap<Language, String>.from({
        Language.tr: 'Hab Bitiş Bölümü',
    }),
    'Robot Count': HashMap<Language, String>.from({
        Language.tr: 'Robot Miktarı',
    }),
    'Robot Type': HashMap<Language, String>.from({
        Language.tr: 'Robot Türü',
    }),
    'Teleop': HashMap<Language, String>.from({
        Language.tr: 'Teleop',
    }),
    'Autonomous': HashMap<Language, String>.from({
        Language.tr: 'Otonom',
    }),
    'Mixed': HashMap<Language, String>.from({
        Language.tr: 'Karışık',
    }),
    'Autonomous Starts With': HashMap<Language, String>.from({
        Language.tr: 'Otonom Neyle Başlıyor',
    }),
    'Cargo': HashMap<Language, String>.from({
        Language.tr: 'Kargo',
    }),
    'Hatch': HashMap<Language, String>.from({
        Language.tr: 'Kapak',
    }),
    'Crossing The Line': HashMap<Language, String>.from({
        Language.tr: 'Çizgiyi Geçiyor Mu',
    }),
    'Defense Notes': HashMap<Language, String>.from({
        Language.tr: 'Defans Notları',
    }),
    'Notes': HashMap<Language, String>.from({
        Language.tr: 'Notlar',
    }),
    'Main Screen': HashMap<Language, String>.from({
        Language.tr: 'Ana Ekran',
    }),
    'Input Screen': HashMap<Language, String>.from({
        Language.tr: 'Giriş Ekranı',
    }),
    'QR Screen': HashMap<Language, String>.from({
        Language.tr: 'QR Ekranı',
    }),
    'Red': HashMap<Language, String>.from({
        Language.tr: 'Kırmızı',
    }),
    'Blue': HashMap<Language, String>.from({
        Language.tr: 'Mavi',
    }),
    '%counter': HashMap<Language, String>.from({
        Language.tr: '%counter',
    }),
    'Ball Count of Lower Hole / Teleop': HashMap<Language, String>.from({
        Language.tr: 'Alt Deliğin Top Miktarı / Teleop',
    }),
    'Ball Count of Upper Hole / Teleop': HashMap<Language, String>.from({
        Language.tr: 'Üst Deliğin Top Miktarı / Teleop',
    }),
    'Ball Count of Small Hole / Teleop': HashMap<Language, String>.from({
        Language.tr: 'Küçük Deliğin Top Miktarı / Teleop',
    }),
    'Ball Count of Lower Hole / Autonomous': HashMap<Language, String>.from({
        Language.tr: 'Alt Deliğin Top Miktarı / Otonom',
    }),
    'Ball Count of Upper Hole / Autonomous': HashMap<Language, String>.from({
        Language.tr: 'Üst Deliğin Top Miktarı / Otonom',
    }),
    'Ball Count of Small Hole / Autonomous': HashMap<Language, String>.from({
        Language.tr: 'Küçük Deliğin Top Miktarı / Otonom',
    }),
    'Staying in Balance': HashMap<Language, String>.from({
        Language.tr: 'Dengede Durabilme',
    }),
    'Can Adjust Balance': HashMap<Language, String>.from({
        Language.tr: 'Dengeyi Ayarlayabilme',
    }),
    'Moved Away From Line': HashMap<Language, String>.from({
        Language.tr: 'Çizgiyi Geçebilme',
    }),
    'Did Trench Run': HashMap<Language, String>.from({
        Language.tr: 'Trench Run Yapımı',
    }),
    'Bar Climb Time': HashMap<Language, String>.from({
        Language.tr: 'Demir Tırmanma Süresi',
    }),
    'Control Panel': HashMap<Language, String>.from({
        Language.tr: 'Kontrol Paneli',
    }),
    'None': HashMap<Language, String>.from({
        Language.tr: 'Hiç',
    }),
    '3 lap': HashMap<Language, String>.from({
        Language.tr: '3 tur',
    }),
    '3 lap with precise alignment': HashMap<Language, String>.from({
        Language.tr: 'İnce ayarla 3 tur',
    }),
    'Disabled': HashMap<Language, String>.from({
        Language.tr: 'Kapalı',
    }),
    'Stopwatch': HashMap<Language, String>.from({
        Language.tr: 'Sayaç',
    }),
});
/*
extension LangParsing on String {
    String lang(String language) {
        if (language == Language.en) return this;
        if (this == null) return '';
        if (this.length < 2) return this;
        return local[this][language];
    }
}
*/

enum Language {
    en,
    tr,
}

class LocaleString {
    Language lang;
    LocaleString() : lang = Language.en;
    String get(String item) {
        if (lang == Language.en) return item;
        if (item == null) return '';
        if (item.length < 2) return item;
        return local[item][lang];
    }
}

LocaleString locale = LocaleString();
