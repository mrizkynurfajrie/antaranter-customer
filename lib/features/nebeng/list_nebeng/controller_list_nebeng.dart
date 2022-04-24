import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/api_list_nebeng.dart';
import 'package:intake_customer/response/nebeng_response.dart';
import 'package:intake_customer/shared/helpers/format_date_time.dart';
import 'package:intake_customer/shared/widgets/bottomsheet/bottomsheet_selection.dart';
import 'package:intake_customer/shared/widgets/cards/card_item.dart';
import 'package:intake_customer/shared/widgets/others/show_dialog.dart';
import 'package:intl/intl.dart';

class ControllerListNebeng extends GetxController {
  final ApiListNebeng api;
  ControllerListNebeng({required this.api});

  final listNebeng = List<NebengResponse>.empty().obs;

  late TextEditingController txtDateDeptStart;
  late TextEditingController txtDateDeptEnd;

  var selectedCityDept = 'Pilih kota keberangkatan'.obs;
  var selectedCityArv = 'Pilih kota tujuan'.obs;

  var cities = <ModelBottomsheet>[].obs;
  var search = ''.obs;

  final now = DateTime.now();

  var initDateEnd = DateTime.now().add(const Duration(days: 1)).obs;

  var loading = false.obs;
  var loadingList = false.obs;

  @override
  void onInit() {
    txtDateDeptStart = TextEditingController();
    txtDateDeptEnd = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    txtDateDeptStart.dispose();
    txtDateDeptEnd.dispose();
    super.dispose();
  }

  void getData() async {
    loading.value = loadingList.value = true;
    listNebeng.clear();
    resetFilter();
    try {
      var res = await api.listNebeng();
      if (res['success'] == true) {
        var data = res['data'];
        var resultNebeng = (data as List)
            .map((data) => NebengResponse.fromJson(data))
            .toList();
        if (resultNebeng.isNotEmpty) {
          resultNebeng = resultNebeng
              .where(
                  (nebeng) => daysBetween(nebeng.dateDep!, DateTime.now()) < 0)
              .toList();
          listNebeng.addAll(resultNebeng);
          // print(listNebeng);
          await getCities();
          loading.value = loadingList.value = false;
        } else {
          await getCities();
          loading.value = loadingList.value = false;
        }
      } else {
        throw "Something error";
      }
    } catch (e) {
      loading.value = loadingList.value = false;
      log(e.toString());
      // change(null, status: RxStatus.error(e.toString()));
      showPopUpError(errorMessage: e.toString(), errorTitle: "Failed");
    }
  }

  getCities() async {
    try {
      cities.clear();
      var r = await api.cities();
      for (var x in r['data']) {
        cities.add(ModelBottomsheet(
          itemName: x['name'],
          widget: CardItem(
            data: x,
          ),
          value: x['id'],
        ));
        cities.sort((a, b) => a.itemName.compareTo(b.itemName));
      }
    } catch (e) {
      loading.value = loadingList.value = false;
      log(e.toString());
      // change(null, status: RxStatus.error(e.toString()));
      showPopUpError(errorMessage: e.toString(), errorTitle: "Failed");
    }
  }

  Future<void> onRefresh() async {
    loading.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    getData();
  }

  buildCitiesDep(context) {
    BottomsheetSelection(
        title: 'Pilih Kota',
        context: context,
        listWidget: cities,
        value: (value) async {
          if (value != null) {
            search.value = '';
            // search(value);
            log(value.toString());
            Navigator.pop(context);
          }
        },
        itemName: (value) {
          selectedCityDept.value = value;
        }).showSelection();
  }

  buildCitiesArv(context) {
    BottomsheetSelection(
        title: 'Pilih Kota',
        context: context,
        listWidget: cities,
        value: (value) async {
          if (value != null) {
            search.value = '';
            // search(value);
            log(value.toString());
            Navigator.pop(context);
          }
        },
        itemName: (value) {
          selectedCityArv.value = value;
        }).showSelection();
  }

  void searchData() async {
    loadingList.value = true;
    listNebeng.clear();
    try {
      var res = await api.listNebeng();
      if (res['success'] == true) {
        var data = res['data'];
        var resultNebeng = (data as List)
            .map((data) => NebengResponse.fromJson(data))
            .toList();
        if (resultNebeng.isNotEmpty) {
          // print(listNebeng);
          resultNebeng = resultNebeng
              .where(
                  (nebeng) => daysBetween(nebeng.dateDep!, DateTime.now()) < 0)
              .toList();
          var resultFilter = await filterData(resultNebeng);
          listNebeng.addAll(resultFilter);
          loadingList.value = false;
        } else {
          loadingList.value = false;
        }
      } else {
        throw "Something error";
      }
    } catch (e) {
      log(e.toString());
      loadingList.value = false;
      showPopUpError(errorMessage: e.toString(), errorTitle: "Failed");
      // change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<List<NebengResponse>> filterData(List<NebengResponse> data) async {
    var listFilterNebeng = List<NebengResponse>.empty();
    var isFilterLocation = false;
    try {
      if (selectedCityDept.value != 'Pilih kota keberangkatan' &&
          selectedCityArv.value != 'Pilih kota tujuan') {
        listFilterNebeng = data
            .where((nebeng) =>
                nebeng.cityOrigin == selectedCityDept.value &&
                nebeng.cityDestination == selectedCityArv.value)
            .toList();
        isFilterLocation = true;
      } else if (selectedCityDept.value != 'Pilih kota keberangkatan') {
        listFilterNebeng = data
            .where((nebeng) => nebeng.cityOrigin == selectedCityDept.value)
            .toList();
        isFilterLocation = true;
      } else if (selectedCityArv.value != 'Pilih kota tujuan') {
        listFilterNebeng = data
            .where((nebeng) => nebeng.cityDestination == selectedCityArv.value)
            .toList();
        isFilterLocation = true;
      }
      // print(txtDateDeptEnd.text.isNotEmpty);
      var dateStart = txtDateDeptStart.text.isNotEmpty
          ? LocaleTime.stringDateToDateTime(txtDateDeptStart.text)
          : DateTime.now();
      var dateEnd = txtDateDeptEnd.text.isNotEmpty
          ? LocaleTime.stringDateToDateTime(txtDateDeptEnd.text)
          // .add(const Duration(days: 1))
          : LocaleTime.stringDateToDateTime("9999-12-30");

      if (isFilterLocation) {
        listFilterNebeng = listFilterNebeng
            .where((nebeng) =>
                daysBetween(nebeng.dateDep!, dateStart) <= 0 &&
              daysBetween(nebeng.dateDep!, dateEnd) >= 0)
            .toList();
      } else {
        listFilterNebeng = data.where((nebeng) {
          // print(
          //     "ID ${nebeng.id} ${nebeng.dateDep!.toUtc().compareTo(dateStart.toUtc())} ${nebeng.dateDep!.compareTo(dateEnd)}");
          // print(
          //     "ID ${nebeng.id} ${daysBetween(nebeng.dateDep!, dateStart)} ${daysBetween(nebeng.dateDep!, dateEnd)}");
          return daysBetween(nebeng.dateDep!, dateStart) <= 0 &&
              daysBetween(nebeng.dateDep!, dateEnd) >= 0;
        }).toList();
      }
    } catch (e) {
      log(e.toString());
      loadingList.value = false;
      showPopUpError(errorMessage: e.toString(), errorTitle: "Failed");
    }

    return listFilterNebeng;
  }

  void resetFilter() {
    selectedCityDept = 'Pilih kota keberangkatan'.obs;
    selectedCityArv = 'Pilih kota tujuan'.obs;
    txtDateDeptStart.text = '';
    txtDateDeptEnd.text = '';
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
