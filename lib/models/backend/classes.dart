class Admin {
  final String userName;
  final String password;

  Admin({required this.userName, required this.password});

  Map<String, String> toMap() {
    return {
      'UserName': userName,
      'Password': password,
    };
  }
}

class CameraCategory {
  final int catId;
  final String catName;

  CameraCategory(this.catId, this.catName);

  Map<String, Object> toMap() {
    return {
      'catId': catId,
      'catName': catName,
    };
  }
}

class Camera {
  final String name;
  final int catId;
  final String productId;
  final String picAddress;
  final String kind;
  final String dimension;
  final String weight;
  final String color;
  final String battery;
  final String axbardariMomtad;
  final String storageKind;
  final String internalStorage;
  final String resolution;
  final String picFormat;
  final String videoSpeed;
  final String explain;
  final String price;
  final String status;

  Camera(
      this.name,
      this.catId,
      this.productId,
      this.picAddress,
      this.kind,
      this.dimension,
      this.weight,
      this.color,
      this.battery,
      this.axbardariMomtad,
      this.storageKind,
      this.internalStorage,
      this.resolution,
      this.picFormat,
      this.videoSpeed,
      this.explain,
      this.price,
      this.status);

  Map<String, Object> toMap() {
    return {
      'name': name,
      'catId': catId,
      'productId': productId,
      'picAddress': picAddress,
      'kind': kind,
      'dimension': dimension,
      'weight': weight,
      'color': color,
      'battery': battery,
      'axbardariMomtad': axbardariMomtad,
      'storageKind': storageKind,
      'internalStorage': internalStorage,
      'resolution': resolution,
      'picFormat': picFormat,
      'videoSpeed': videoSpeed,
      'explain': explain,
      'price': price,
      'status': status
    };
  }
}

class MobileCategory {
  final int catId;
  final String catName;

  MobileCategory(this.catId, this.catName);

  Map<String, Object> toMap() {
    return {
      'catId': catId,
      'catName': catName,
    };
  }
}

class Mobile {
  final String name;
  final int catId;
  final String productId;
  final String picAddress;
  final String brand;
  final String scrrenDimension;
  final String weight;
  final String color;
  final String battery;
  final String storageKind;
  final String internalStorage;
  final String frontCameraResolution;
  final String backCameraResolution;
  final String picFormat;
  final String videoSpeed;
  final String explain;
  final String price;
  final String status;

  Mobile(
      this.name,
      this.catId,
      this.productId,
      this.picAddress,
      this.brand,
      this.scrrenDimension,
      this.weight,
      this.color,
      this.battery,
      this.storageKind,
      this.internalStorage,
      this.frontCameraResolution,
      this.backCameraResolution,
      this.picFormat,
      this.videoSpeed,
      this.explain,
      this.price,
      this.status);

  Map<String, Object> toMap() {
    return {
      'name': name,
      'catId': catId,
      'productId': productId,
      'picAddress': picAddress,
      'brand': brand,
      'scrrenDimension': scrrenDimension,
      'weight': weight,
      'color': color,
      'battery': battery,
      'storageKind': storageKind,
      'internalStorage': internalStorage,
      'frontCameraResolution': frontCameraResolution,
      'backCameraResolution': backCameraResolution,
      'picFormat': picFormat,
      'videoSpeed': videoSpeed,
      'explain': explain,
      'price': price,
      'status': status,
    };
  }
}

class Order {
  final String customerId;
  final String productId;
  final String productName;
  final String catName;
  final String catId;
  final String status;

  Order(this.customerId, this.productId, this.productName, this.catName,
      this.catId, this.status);

  Map<String, Object> toMap() {
    return {
      'customerId': customerId,
      'productId': productId,
      'productName': productName,
      'catName': catName,
      'catId': catId,
      'status': status,
    };
  }
}

class User {
  final int customerId;
  final String customerName;
  final String city;
  final String phone;
  final String address;
  final String mail;

  User(this.customerName, this.city, this.phone, this.address, this.mail,
      this.customerId);

  Map<String, Object> toMap() {
    return {
      'customerId': customerId,
      'customerName': customerName,
      'city': city,
      'phone': phone,
      'address': address,
      'mail': mail,
    };
  }
}
