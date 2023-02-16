import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TextFieldIslemleri(title: 'Flutter Demo Home Page'),
    );
  }
}

class TextFieldIslemleri extends StatelessWidget {
  final String title;
  const TextFieldIslemleri({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              // klavyedeki karakterlerin ne olacağını belirliyoruz
              keyboardType: TextInputType.number,

              // klavyedeki enter tuşunun simgesini belirliyoruz
              textInputAction: TextInputAction.next,

              // sayfa açıldığında textfield seçili olarak gelir
              autofocus: true,

              // max 5 satırlık yazım alanı
              maxLines: 2,

              // max girilebilecek karakter sayısı
              maxLength: 21,

              decoration: InputDecoration(
                // Text başlığı
                labelText: 'Label Text1',

                // Tıklanınca veri girilmeden önce gözüken yazı
                hintText: 'Adınızı Giriniz',
                hintStyle: const TextStyle(color: Colors.pink),

                // textfieldin başına icon ekliyor
                icon: const Icon(Icons.abc),

                // textfield içinin rengini belirleyebiliyoruz
                filled: true,
                fillColor: Colors.amber.shade100,

                // etrafını belirgin hale getiriyoruz
                border: const OutlineInputBorder(),
              ),

              // kullanıcının girmiş olduğu değerlerin son durumunu verir
              // burda console yazdırdık
              onChanged: (String deger) {
                print(deger);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              // klavyedeki karakterlerin ne olacağını belirliyoruz
              keyboardType: TextInputType.number,

              // klavyedeki enter tuşunun simgesini belirliyoruz
              textInputAction: TextInputAction.next,

              decoration: const InputDecoration(
                // Text başlığı
                labelText: 'Label Text2',

                // Tıklanınca veri girilmeden önce gözüken yazı
                hintText: 'E-mail Giriniz',
                hintStyle: TextStyle(color: Colors.red),

                // textfieldin iç kısmında başına ve sonuna icon ekliyoruz
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.access_time_sharp),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
              ),

              // onay tuşuna basınca girilen değerin tamamını yazdırır
              onSubmitted: (String deger) {
                print(deger);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
