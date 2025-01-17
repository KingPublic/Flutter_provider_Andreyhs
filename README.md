
# Laporan Proyek: Manajemen State Lanjutan di Flutter

## Deskripsi Proyek

Proyek ini bertujuan untuk mengimplementasikan **manajemen state lanjutan** dalam aplikasi Flutter. Proyek ini dibagi menjadi tiga bagian utama:
1. **Manajemen State Lokal**
2. **Manajemen State Global**
3. **UI dan Interaktivitas Lanjutan**

Setiap bagian menunjukkan bagaimana menggunakan manajemen state dengan cara yang lebih kompleks, termasuk pengelolaan state global menggunakan `Provider` dan penerapan fitur UI interaktif.

## Fitur Utama

### Bagian 1: Manajemen State Lokal

- **Tujuan**: Mengelola state aplikasi secara lokal menggunakan `StatefulWidget`.
- **Fitur**: Counter yang dapat diubah nilainya dengan dua tombol, yaitu **Increment** dan **Decrement**.
- **Pembatasan**: Nilai counter tidak boleh kurang dari nol.

#### Contoh Kode

```dart
class LocalCounterWidget extends StatefulWidget {
  @override
  _LocalCounterWidgetState createState() => _LocalCounterWidgetState();
}

class _LocalCounterWidgetState extends State<LocalCounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Local Counter: $_counter', style: TextStyle(fontSize: 24)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _increment, child: Text('Increment')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: _decrement, child: Text('Decrement')),
          ],
        ),
      ],
    );
  }
}
```

### Bagian 2: Manajemen State Global

- **Tujuan**: Mengelola state aplikasi secara global dengan menggunakan **Provider**.
- **Fitur**: Counter dapat ditambahkan, dihapus, dan dimodifikasi secara global.
- **State**: Setiap counter memiliki warna dan label yang dapat disesuaikan.

#### Contoh Kode

```dart
class Counter {
  int value;
  Color color;
  String label;

  Counter({this.value = 0, this.color = Colors.blue, this.label = 'Counter'});
}

class GlobalState extends ChangeNotifier {
  final List<Counter> _counters = [];

  List<Counter> get counters => List.unmodifiable(_counters);

  void addCounter() {
    _counters.add(Counter());
    notifyListeners();
  }

  void removeCounter(int index) {
    _counters.removeAt(index);
    notifyListeners();
  }

  void increment(int index) {
    _counters[index].value++;
    notifyListeners();
  }

  void decrement(int index) {
    if (_counters[index].value > 0) {
      _counters[index].value--;
      notifyListeners();
    }
  }

  void updateColor(int index, Color color) {
    _counters[index].color = color;
    notifyListeners();
  }

  void updateLabel(int index, String label) {
    _counters[index].label = label;
    notifyListeners();
  }
}
```

### Bagian 3: UI dan Interaktivitas Lanjutan

- **Tujuan**: Memperkenalkan animasi, drag-and-drop, dan pengaturan UI dinamis.
- **Fitur**: 
  - **Animasi** pada tombol Increment dan Decrement.
  - **Drag-and-drop** untuk mengubah urutan counter.
  - Setiap counter memiliki **warna dan label** unik yang dapat disesuaikan.

#### Contoh Kode

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:global_state/global_state.dart';

class AdvancedCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Counter App'),
      ),
      body: Consumer<GlobalState>(
        builder: (context, globalState, child) {
          return ListView.builder(
            itemCount: globalState.counters.length,
            itemBuilder: (context, index) {
              final counter = globalState.counters[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: counter.color,
                ),
                title: Text('${counter.label}: ${counter.value}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => globalState.increment(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => globalState.decrement(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.color_lens),
                      onPressed: () {
                        // Ubah warna menggunakan dialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Select Color'),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: Colors.primaries.map((color) {
                                  return GestureDetector(
                                    onTap: () {
                                      globalState.updateColor(index, color);
                                      Navigator.pop(context);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: color,
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<GlobalState>(context, listen: false).addCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

```

## Alat yang Digunakan

- **Flutter**: Framework utama untuk pengembangan aplikasi.
- **Provider**: Untuk manajemen state global.
- **ReorderableListView**: Untuk mendukung fitur drag-and-drop dalam mengatur ulang urutan counter.
- **Pembuatan packages untuk global_state**: Sesuai dengan part2 di elearn.

## Cara Menjalankan Proyek

1. **Clone repositori**:  
   ```bash
   git clone https://github.com/KingPublic/Flutter_provider_Andreyhs
   ```
2. **Install dependensi**:  
   ```bash
   flutter pub get
   ```
3. **Jalankan aplikasi**:  
   ```bash
   flutter run
   ```

## Kesimpulan

Proyek ini menunjukkan penggunaan **manajemen state lokal** dan **global** yang efektif menggunakan **Provider** dan **StatefulWidget** di Flutter. Fitur UI lanjutan seperti animasi dan drag-and-drop membuat aplikasi ini lebih dinamis dan interaktif, memberikan pengalaman pengguna yang menarik dan fungsional.

