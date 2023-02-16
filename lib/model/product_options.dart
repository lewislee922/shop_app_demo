class ColorOption {
  final String colorName;
  final int colorValue;

  ColorOption(this.colorName, this.colorValue);

  ColorOption.fromJson(Map<String, dynamic> json)
      : colorName = json['colorName'],
        colorValue = json['colorValue'];

  static List<ColorOption> sampleData() {
    final list = <ColorOption>[];
    list.add(ColorOption('Space Gray', 0xffa7a6aa));
    list.add(ColorOption('Sliver', 0xffe9e8eb));
    list.add(ColorOption('Gold', 0xffeee0cd));
    return list;
  }
}

class SpecOption {
  final String category;
  final List<String> options;

  SpecOption(this.category, this.options);

  SpecOption.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        options = List<String>.from(json['options']);

  static List<SpecOption> sampleData() {
    final list = <SpecOption>[];
    list.add(
        SpecOption('Memory', ['8GB Unified memory', '16GB Unified memory']));
    list.add(SpecOption('Storage', [
      '256GB SSD Storage',
      '512GB SSD Storage',
      '1TB SSD Storage',
      '2TB SSD Storage'
    ]));
    return list;
  }
}
