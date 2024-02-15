import 'package:flutter/material.dart';

import '../utilities/variables/app_texts.dart';

class ConvertTimestamp {
  // 
  static String toDateTime(String timestamp) {
    String date_ = toDate(timestamp);
    String time_ = toTime(timestamp);
    return "$date_ - $time_";
  }

  static String secondToTime(int seconds) {
    String time_ = "$seconds s";
    final duration = Duration(seconds: seconds);

    if (duration.inMinutes < 0) {
      String s = duration.inSeconds < 10
          ? "0${duration.inSeconds} s"
          : "${duration.inSeconds} s";
      time_ = s;
    }
    return time_;
  }

  static String toTime(String timestamp) {
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    String hour = _time.hour < 10 ? "0${_time.hour}" : _time.hour.toString();
    String min =
        _time.minute < 10 ? "0${_time.minute}" : _time.minute.toString();
    String time_ = "$hour:$min";
    return time_;
  }


  static bool isSameDate(String timestamp1, String timestamp2) {
    DateTime time1_ =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp1));
    DateTime time2_ =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp2));
    if ((time1_.year == time2_.year) &&
        (time1_.month == time2_.month) &&
        (time1_.day == time2_.day)) {
      return true;
    } else {
      return false;
    }
  }

  static int timeSpentInDdays(String timestamp, int nbreDays) {
    // La date de publication
    DateTime time_ = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    // Ajout de la durée de publication autorisée
    DateTime timeAdd_ = time_.add(Duration(days: nbreDays));
    // Recupération du temps entre la durée de pub et le temps présent.
    Duration spent_ = timeAdd_.difference(DateTime.now());
    // En secondes
    int inDays_ = spent_.inDays;
    return inDays_;
  }

  static String timeSpent(String timestamp, int nbreHours) {
    // La date de publication
    DateTime time_ = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    // Ajout de la durée de publication autorisée
    DateTime timeAdd_ = time_.add(Duration(hours: nbreHours));
    // Recupération du temps entre la durée de pub et le temps présent.
    Duration spent_ = timeAdd_.difference(DateTime.now());
    // 
    // DateTime spentDateTime = DateTime(0, 0, 0, spent_.inHours);
    // 
   
    int secs_ = spent_.inSeconds;

    String unitySecs_ = "seconde(s)";
    String unityMins_ = "minute(s)";
    String unityHours_ = "heure(s)";
    String unityDays_ = "jour(s)";

    String response_ = "";

    if(secs_ < 0) {
      response_ = "";
    }
    // Si secondes <= 60 alors on aura des secondes
    else if (secs_ <= 60) {
      response_ += "$secs_ $unitySecs_";
    }
    // Si 3600 > secondes > 60  alors on aura des minutes
    else if((3600 > secs_) && (secs_ > 60)){
      int resMins =  int.parse("${(secs_ / 60)}");
      int resSecs = secs_ % 60;
      response_ += "$resMins $unityMins_ $resSecs $unitySecs_";
    }
    // Si 86400 > secondes > 3600 alors on aura des heures
    else if((86400 > secs_) && (secs_ > 3600)){
      double res = secs_ / 3600;
      int resHours = res.toInt();
      int resMins = secs_ % 60;
      response_ += "$resHours $unityHours_ $resMins $unityMins_";
    }
    // Si secondes >= 86400 alors on aura des jours
    else if(secs_ >= 86400){
      int resDays = int.parse("${(secs_ / 86400)}");
      int resHours = int.parse("${((secs_ % 86400) / 3600)}");
      response_ += "$resDays $unityDays_ $resHours $unityHours_";
    }

    // print(response_);
    
    return response_;
  }

  static String toDate(String timestamp) {
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    String day = _time.day < 10 ? "0${_time.day}" : _time.day.toString();
    String year = _time.year.toString();
    String month = "Jan";
    switch (_time.month) {
      case 1:
        month = "Jan";
        break;
      case 2:
        month = "Fev";
        break;
      case 3:
        month = "Mar";
        break;
      case 4:
        month = "Avr";
        break;
      case 5:
        month = "Mai";
        break;
      case 6:
        month = "Juin";
        break;
      case 7:
        month = "Juil";
        break;
      case 8:
        month = "Aôut";
        break;
      case 9:
        month = "Sept";
        break;
      case 10:
        month = "Oct";
        break;
      case 11:
        month = "Nov";
        break;
      case 12:
        month = "Dec";
        break;
      default:
        month = "Janv";
    }

    String _date = "$day $month $year";
    return _date;
  }

  static String getDay(String timestamp) {
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    String day = _time.day < 10 ? "0${_time.day}" : _time.day.toString();
    return day;
  }

  static String getMonth(String timestamp) {
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    String month = "Janvier";
    switch (_time.month) {
      case 1:
        month = "Janvier";
        break;
      case 2:
        month = "Février";
        break;
      case 3:
        month = "Mars";
        break;
      case 4:
        month = "Avril";
        break;
      case 5:
        month = "Mai";
        break;
      case 6:
        month = "Juin";
        break;
      case 7:
        month = "Juillet";
        break;
      case 8:
        month = "Aôut";
        break;
      case 9:
        month = "Septembre";
        break;
      case 10:
        month = "Octobre";
        break;
      case 11:
        month = "Novembre";
        break;
      case 12:
        month = "Decembre";
        break;
      default:
        month = "Janvier";
    }
    return month;
  }

  static String getYear(String timestamp) {
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    String year = _time.year.toString();
    return year;
  }

  static Future<DateTime?> showTheDatePicker(BuildContext context, {DateTime? startDate}) async {
    return await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: startDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      confirmText: AppTexts.toConfirme,
      cancelText: AppTexts.toCancel,
      helpText: AppTexts.date,
    );
  }

  static Future<TimeOfDay?> showTheTimePicker(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      confirmText: AppTexts.toConfirme,
      cancelText: AppTexts.toCancel,
      helpText: AppTexts.hourAndMinutes,
    );
  }

  static String toHour(TimeOfDay timeOfDay) {
    String time = "${timeOfDay.hour}:${timeOfDay.minute}";
    String hour = "";
    String minutes = "";
    String ampm = "";
    if (timeOfDay.hour < 10) {
      hour = "0${timeOfDay.hour}";
    } else {
      hour = "${timeOfDay.hour}";
    }

    if (timeOfDay.minute < 10) {
      minutes = "0${timeOfDay.minute}";
    } else {
      minutes = "${timeOfDay.minute}";
    }

    if (timeOfDay.hour < 10) {
      hour = "0${timeOfDay.hour}";
    }

    if (timeOfDay.period == DayPeriod.am) {
      ampm = "AM";
    } else {
      ampm = "PM";
    }

    time = "$hour:$minutes $ampm";
    return time;
  }
}
