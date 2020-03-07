import 'dart:collection';

import 'package:flutter/material.dart';


HashMap<String, HashMap<Language, String>> local = HashMap.from({
    'Team': HashMap.from({
        Language.tr: 'Takım',
    }),
    'English': HashMap.from({
        Language.tr: 'İngilizce',
    }),
    'Turkish': HashMap.from({
        Language.tr: 'Türkçe',
    }),
    'Start the timer': HashMap.from({
        Language.tr: 'Sayacı başlat',
    }),
    'End the timer': HashMap.from({
        Language.tr: 'Sayacı bitir',
    }),
    'Team Number': HashMap.from({
        Language.tr: 'Takım numarası',
    }),
    'Driver Station Color': HashMap.from({
        Language.tr: 'Sürücü İstasyonu Rengi',
    }),
    'Driver Station Alignment': HashMap.from({
        Language.tr: 'Sürücü İstasyonu Hizası',
    }),
    'Left': HashMap.from({
        Language.tr: 'Sol',
    }),
    'Middle': HashMap.from({
        Language.tr: 'Orta',
    }),
    'Right': HashMap.from({
        Language.tr: 'Sağ',
    }),
    'Cargo Placement': HashMap.from({
        Language.tr: 'Kargo Alımı',
    }),
    'Take cargo': HashMap.from({
        Language.tr: 'Kargo al',
    }),
    'Place cargo': HashMap.from({
        Language.tr: 'Kargo bırak',
    }),
    'Hatch Placement': HashMap.from({
        Language.tr: 'Kapak alımı',
    }),
    'Take hatch': HashMap.from({
        Language.tr: 'Kapak al',
    }),
    'Place hatch': HashMap.from({
        Language.tr: 'Kapak bırak',
    }),
    'Hab Climb Time': HashMap.from({
        Language.tr: 'Hab tırmanma süresi',
    }),
    'Start the counter': HashMap.from({
        Language.tr: 'Sayacı başlat',
    }),
    'End the counter': HashMap.from({
        Language.tr: 'Sayacı bitir',
    }),
    'Hab Start Level': HashMap.from({
        Language.tr: 'Hab Başlangıç Bölümü',
    }),
    'Hab End Level': HashMap.from({
        Language.tr: 'Hab Bitiş Bölümü',
    }),
    'Robot Count': HashMap.from({
        Language.tr: 'Robot Miktarı',
    }),
    'Robot Type': HashMap.from({
        Language.tr: 'Robot Türü',
    }),
    'Teleop': HashMap.from({
        Language.tr: 'Teleop',
    }),
    'Autonomous': HashMap.from({
        Language.tr: 'Otonom',
    }),
    'Mixed': HashMap.from({
        Language.tr: 'Karışık',
    }),
    'Autonomous Starts With': HashMap.from({
        Language.tr: 'Otonom Neyle Başlıyor',
    }),
    'Cargo': HashMap.from({
        Language.tr: 'Kargo',
    }),
    'Hatch': HashMap.from({
        Language.tr: 'Kapak',
    }),
    'Crossing The Line': HashMap.from({
        Language.tr: 'Çizgiyi Geçiyor Mu',
    }),
    'Defense Notes': HashMap.from({
        Language.tr: 'Defans Notları',
    }),
    'Notes': HashMap.from({
        Language.tr: 'Notlar',
    }),
    'Main Screen': HashMap.from({
        Language.tr: 'Ana Ekran',
    }),
    'Input Screen': HashMap.from({
        Language.tr: 'Giriş Ekranı',
    }),
    'QR Screen': HashMap.from({
        Language.tr: 'QR Ekranı',
    }),
    'Red': HashMap.from({
        Language.tr: 'Kırmızı',
    }),
    'Blue': HashMap.from({
        Language.tr: 'Mavi',
    }),
    '%counter': HashMap.from({
        Language.tr: '%counter',
    }),
    'Ball Count of Lower Hole / Teleop': HashMap.from({
        Language.tr: 'Alt Deliğin Top Miktarı / Teleop',
    }),
    'Ball Count of Upper Hole / Teleop': HashMap.from({
        Language.tr: 'Üst Deliğin Top Miktarı / Teleop',
    }),
    'Ball Count of Small Hole / Teleop': HashMap.from({
        Language.tr: 'Küçük Deliğin Top Miktarı / Teleop',
    }),
    'Ball Count of Lower Hole / Autonomous': HashMap.from({
        Language.tr: 'Alt Deliğin Top Miktarı / Otonom',
    }),
    'Ball Count of Upper Hole / Autonomous': HashMap.from({
        Language.tr: 'Üst Deliğin Top Miktarı / Otonom',
    }),
    'Ball Count of Small Hole / Autonomous': HashMap.from({
        Language.tr: 'Küçük Deliğin Top Miktarı / Otonom',
    }),
    'Staying in Balance': HashMap.from({
        Language.tr: 'Dengede Durabilme',
    }),
    'Can Adjust Balance': HashMap.from({
        Language.tr: 'Dengeyi Ayarlayabilme',
    }),
    'Moved Away From Line': HashMap.from({
        Language.tr: 'Çizgiyi Geçebilme',
    }),
    'Did Trench Run': HashMap.from({
        Language.tr: 'Trench Run Yapımı',
    }),
    'Bar Climb Time': HashMap.from({
        Language.tr: 'Demir Tırmanma Süresi',
    }),
    'Control Panel': HashMap.from({
        Language.tr: 'Kontrol Paneli',
    }),
    'None': HashMap.from({
        Language.tr: 'Hiç',
    }),
    '3 lap': HashMap.from({
        Language.tr: '3 tur',
    }),
    '3 lap with precise alignment': HashMap.from({
        Language.tr: 'İnce ayarla 3 tur',
    }),
    'Disabled': HashMap.from({
        Language.tr: 'Kapalı',
    }),
    'Stopwatch': HashMap.from({
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
