// Component
abstract class FileSystemComponent {
  String getName();
  void display([String prefix = '']);
}

// Leaf
class File implements FileSystemComponent {
  String name;

  File(this.name);

  @override
  String getName() {
    return name;
  }

  @override
  void display([String prefix = '']) {
    print("$prefix File: $name");
  }
}

// Composite
class Directory implements FileSystemComponent {
  String name;
  List<FileSystemComponent> components = [];

  Directory(this.name);

  void addComponent(FileSystemComponent component) {
    components.add(component);
  }

  void removeComponent(FileSystemComponent component) {
    components.remove(component);
  }

  @override
  String getName() {
    return name;
  }

  @override
  void display([String prefix = '']) {
    print('$prefix Directory: $name');
    for (var component in components) {
      component.display('$prefix  |-');
    }
  }
}
