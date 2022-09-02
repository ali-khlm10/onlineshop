class Admin {
  final String userName;
  final String password;

  Admin(this.userName, this.password);
}

class CameraCategory {
  final int catId;
  final String catName;

  CameraCategory(this.catId, this.catName);
}

class Camera {
  final String name;
  final int catId;
  final String productId;
  final String PicAddress;
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
      this.PicAddress,
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
}

class MobileCategory {
  final int catId;
  final String catName;

  MobileCategory(this.catId, this.catName);
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
}

class Orders {
  final String customerId;
  final String productId;
  final String productName;
  final String catName;
  final String catId;
  final String status;

  Orders(this.customerId, this.productId, this.productName, this.catName,
      this.catId, this.status);
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
}
