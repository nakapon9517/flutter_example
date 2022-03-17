enum Role {
  admin,
  onlyWrite,
  onlyRead,
}

abstract class IRoll {
  late Role _role;
  bool isAdmin();
  bool isWrite();
  bool isRead();
}

class Roll extends IRoll {
  @override
  bool isAdmin() {
    return Role.admin == _role;
  }

  @override
  bool isWrite() {
    return Role.onlyWrite == _role;
  }

  @override
  bool isRead() {
    return Role.onlyRead == _role;
  }
}

class RoomRoll extends Roll {}

class MessageRoll extends Roll {}
