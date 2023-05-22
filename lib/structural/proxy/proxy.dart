// Subject interface
abstract class Image {
  void display();
}

// RealSubject
class RealImage implements Image {
  late String filename;

  RealImage(this.filename) {
    loadFromDisk();
  }

  void loadFromDisk() {
    print("Loading image: $filename...");
    // Simulate loading the image from disk
  }

  @override
  void display() {
    print("Displaying image: $filename");
  }
}

// Proxy
class ImageProxy implements Image {
  late String filename;
  RealImage? realImage;

  ImageProxy(this.filename);

  @override
  void display() {
    realImage ??= RealImage(filename);
    realImage!.display();
  }
}

// Client code
void main() {}
