import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/province.dart';
import '../models/city.dart';

class HomePage extends StatelessWidget {
  String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wilayah Indonesia"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          DropdownSearch<Province>(
            popupProps: PopupProps.dialog(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item.name),
              ),
            ),
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Provinsi",
                hintText: "Provinsi in menu mode",
              ),
            ),
            onChanged: (value) => id = value?.id,
            asyncItems: (text) async {
              var response = await http.get(
                Uri.parse(
                    "https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json"),
              );
              List allProvince = json.decode(response.body);
              List<Province> allModelProvince = [];
              for (var element in allProvince) {
                allModelProvince.add(
                  Province.fromJson(element),
                );
              }
              return allModelProvince;
            },
            clearButtonProps: const ClearButtonProps(
              isVisible: true,
            ),
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? ""),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownSearch<City>(
            popupProps: PopupProps.dialog(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item.name),
              ),
            ),
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Kota",
                hintText: "Kota in menu mode",
              ),
            ),
            onChanged: (value) => print(value),
            asyncItems: (text) async {
              var response = await http.get(
                Uri.parse(
                    "https://www.emsifa.com/api-wilayah-indonesia/api/regencies/$id.json"),
              );
              List allCity = json.decode(response.body);
              List<City> allModelCity = [];
              for (var element in allCity) {
                allModelCity.add(
                  City.fromJson(element),
                );
              }
              return allModelCity;
            },
            clearButtonProps: const ClearButtonProps(
              isVisible: true,
            ),
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? ""),
          ),
        ],
      ),
    );
  }
}
