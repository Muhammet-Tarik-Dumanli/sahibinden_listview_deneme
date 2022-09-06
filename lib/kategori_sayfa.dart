import 'package:flutter/material.dart';
import 'package:sahibinden_listview_deneme/sahibinden_tasarim/kategoriler.dart';

class KategoriSayfa extends StatefulWidget {
  const KategoriSayfa({Key? key}) : super(key: key);

  @override
  State<KategoriSayfa> createState() => _KategoriSayfaState();
}

class _KategoriSayfaState extends State<KategoriSayfa> {

  Future<List<Kategoriler>> kategorileriGetir() async {
    var kategorilerListesi = <Kategoriler>[];

    var k1 = Kategoriler(kategoriId: 1, kategoriAdi: "Emlak", kategoriResmi: "emlak.jpeg", kategoriAltBaslik: "Konut, İş Yeri, Arsa, Konut Projeleri, Bina");
    var k2 = Kategoriler(kategoriId: 1, kategoriAdi: "Vasıta", kategoriResmi: "vasita.jpeg", kategoriAltBaslik: "Otomobil, Arazi, SUV & Pickup, Motosiklet");
    var k3 = Kategoriler(kategoriId: 1, kategoriAdi: "Yedek Parça", kategoriResmi: "parca.jpeg", kategoriAltBaslik: "Bilgisayar, Cep Telefonu, Fotoğraf Makinesi");
    var k4 = Kategoriler(kategoriId: 1, kategoriAdi: "İkinci El ve Sıfır Alışveriş", kategoriResmi: "ikinciEl.jpeg", kategoriAltBaslik: "Konut, İş Yeri, Arsa");
    var k5 = Kategoriler(kategoriId: 1, kategoriAdi: "İş Makineleri & Sanayi", kategoriResmi: "makine.jpeg", kategoriAltBaslik: "İş Makineleri, Tarım Makineleri, Sanayi");
    var k6 = Kategoriler(kategoriId: 1, kategoriAdi: "Ustalar ve Hizmetler", kategoriResmi: "usta.jpeg", kategoriAltBaslik: "Ev Tadilat & Dekorasyon, Nakliye, Araç Servis");
    var k7 = Kategoriler(kategoriId: 1, kategoriAdi: "Özel Ders Verenler", kategoriResmi: "ders.jpeg", kategoriAltBaslik: "Lise & Üniversite, İlkokul & Oortaokul");
    var k8 = Kategoriler(kategoriId: 1, kategoriAdi: "İş İlanları", kategoriResmi: "ilan.jpeg", kategoriAltBaslik: "Avukatlık & Hukuk Danışmanlık, Eğlence");
    var k9 = Kategoriler(kategoriId: 1, kategoriAdi: "Yardımcı Arayanlar", kategoriResmi: "yardimci.jpeg", kategoriAltBaslik: "Bebek & Çocuk Bakıcısı, Yaşlı Bakıcısı");
    var k10 = Kategoriler(kategoriId: 1, kategoriAdi: "Hayvanlar Alemi", kategoriResmi: "hayvanlar.jpeg", kategoriAltBaslik: "Evcil Hayvanlar, Akvaryum Balıkları");

    kategorilerListesi.add(k1);
    kategorilerListesi.add(k2);
    kategorilerListesi.add(k3);
    kategorilerListesi.add(k4);
    kategorilerListesi.add(k5);
    kategorilerListesi.add(k6);
    kategorilerListesi.add(k7);
    kategorilerListesi.add(k8);
    kategorilerListesi.add(k9);
    kategorilerListesi.add(k10);

    return kategorilerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("sahibinden.com"), backgroundColor: Colors.indigoAccent,
        leading: IconButton(onPressed: (){
        }, icon: const Icon(Icons.dehaze)),
        actions: const [
          PopupMenuItem(child: Icon(Icons.mail)),
          PopupMenuItem(child: Icon(Icons.account_circle)),
          PopupMenuItem(child: Icon(Icons.add_a_photo_rounded)),
        ],
      ),

      body: FutureBuilder<List<Kategoriler>>(
        future: kategorileriGetir(),
        builder: (context, snaphot){
          if(snaphot.hasData){
            var kategorilerListesi = snaphot.data;
            return ListView.builder(
              itemCount: kategorilerListesi!.length,
              itemBuilder: (context, indeks){
                var kategori = kategorilerListesi[indeks];
                return Center(
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width: 75, height: 75, child: Image.asset("resimler/${kategori.kategoriResmi}")),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(kategori.kategoriAdi, style: const TextStyle(fontSize: 20),),
                            ),
                            SizedBox(height: 10,),
                            Text("${kategori.kategoriAltBaslik}", style: const TextStyle(fontSize: 15, color: Colors.grey),),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Buradan İlan Verebilirsiniz"),
        onPressed: () {
        },
      ),
    );
  }
}