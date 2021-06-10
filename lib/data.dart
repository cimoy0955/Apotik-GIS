import 'package:flutter/material.dart';

class Apotik {
  final int idMarker;
  final String namaApotik;
  final double latitude;
  final double longitude;
  final String alamat;
  final String foto;

  Apotik({
    @required this.idMarker,
    @required this.namaApotik,
    @required this.latitude,
    @required this.longitude,
    @required this.alamat,
    @required this.foto,
  });
}

List<Apotik> dataApotik = [
  Apotik(
    idMarker: 1,
    namaApotik: "Baru Farma Apotik",
    latitude: -0.919795,
    longitude: 119.871089,
    alamat:
        "Jl. I Gusti Ngurah Rai No.32, Tawanjuka, Kec. Palu Sel., Kota Palu, Sulawesi Tengah 94111",
    foto: "images/baru-farma-apotik.jpg",
  ),
  Apotik(
    idMarker: 2,
    namaApotik: "Apotik Rezki",
    latitude: -0.8980822570733128,
    longitude: 119.84362279560386,
    alamat:
        "Jl. Manggis No.57, Balaroa, Kec. Palu Bar., Kota Palu, Sulawesi Tengah 94111",
    foto: "images/apotik-rezki.jpg",
  ),
  Apotik(
    idMarker: 3,
    namaApotik: "Apotik Novita",
    latitude: -0.8915599203873512,
    longitude: 119.85718404360159,
    alamat:
        "Jl. Imam Bonjol, Baru, Kec. Palu Bar., Kota Palu, Sulawesi Tengah 94111",
    foto: "images/apotik-novita.jpg",
  ),
  Apotik(
    idMarker: 4,
    namaApotik: "Apotik Natural",
    latitude: -0.890873357511788,
    longitude: 119.88456403157342,
    alamat:
        "Jl. Ki Hajar Dewantoro No.60-54, Besusu Tim., Kec. Palu Tim., Kota Palu, Sulawesi Tengah 94118",
    foto: "images/apotik-natural.jpg",
  ),
  Apotik(
    idMarker: 5,
    namaApotik: "Tia Apotik",
    latitude: -0.8823771368841457,
    longitude: 119.87134610630982,
    alamat:
        "Jl. Sam Ratulangi No.36, Besusu Bar., Kec. Palu Tim., Kota Palu, Sulawesi Tengah 94118",
    foto: "images/tia-apotik.jpg",
  ),
  Apotik(
    idMarker: 6,
    namaApotik: "Murni Farma Apotik",
    latitude: -0.890186794953835,
    longitude: 119.86559545051331,
    alamat:
        "Jl. Kimaja No.74, Besusu Bar., Kec. Palu Tim., Kota Palu, Sulawesi Tengah 94111",
    foto: "images/murni-farma-apotik.jpg",
  ),
  Apotik(
    idMarker: 7,
    namaApotik: "Apotek Srikandi",
    latitude: -0.8983397170481953,
    longitude: 119.8609605936027,
    alamat:
        "Jl. Danau Poso No.3, Siranindi, Kec. Palu Bar., Kota Palu, Sulawesi Tengah 94111",
    foto: "images/apotek-srikandi.jpg",
  ),
  Apotik(
    idMarker: 8,
    namaApotik: "Apotek Hasanuddin",
    latitude: -0.8969665947314955,
    longitude: 119.8666683339808,
    alamat:
        "Jl. Sultan Hasanuddin No.10, Lolu Utara, Kec. Palu Sel., Kota Palu, Sulawesi Tengah 94111",
    foto: "images/apotek-hasanuddin.jpg",
  ),
  Apotik(
    idMarker: 9,
    namaApotik: "Apotek Pelita",
    latitude: -0.9002277597117968,
    longitude: 119.87400685742259,
    alamat:
        "Jalan Wolter Mongonsidi No.37, Lolu Selatan, Palu Selatan, Lolu Utara, Kec. Palu Sel., Kota Palu, Sulawesi Tengah 94111",
    foto: "images/apotek-pelita.jpg",
  ),
  Apotik(
    idMarker: 10,
    namaApotik: "Apotek Farmindah 2",
    latitude: -0.902673631533512,
    longitude: 119.87417851878965,
    alamat:
        "Jl. Wolter Monginsidi No.50, Lolu Sel., Kec. Palu Sel., Kota Palu, Sulawesi Tengah 94111",
    foto: "images/apotek-farmindah-2.jpg",
  ),
];
