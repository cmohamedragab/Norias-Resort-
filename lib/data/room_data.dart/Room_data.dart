
class Room {
  final String number;
  final String building;
  final String floor;
  final String type;

  const Room({
    required this.number,
    required this.building,
    required this.floor,
    required this.type,
  });
}

const List<Room> noriasRooms = [
  // Building A - Ground Floor
  Room(number: '101', building: 'A', floor: 'Ground', type: 'Suite'),
  Room(number: '102', building: 'A', floor: 'Ground', type: 'Single'),
  Room(number: '103', building: 'A', floor: 'Ground', type: 'Double'),
  Room(number: '104', building: 'A', floor: 'Ground', type: 'Double'),
  Room(number: '105', building: 'A', floor: 'Ground', type: 'Double'),
  Room(number: '106', building: 'A', floor: 'Ground', type: 'Double'),
  Room(number: '107', building: 'A', floor: 'Ground', type: 'Double'),
  Room(number: '108', building: 'A', floor: 'Ground', type: 'Double'),
  Room(number: '109', building: 'A', floor: 'Ground', type: 'Double'),

  // Building A - Second Floor
  Room(number: '201', building: 'A', floor: 'Second', type: 'Suite'),
  Room(number: '202', building: 'A', floor: 'Second', type: 'Double'),
  Room(number: '203', building: 'A', floor: 'Second', type: 'Double'),
  Room(number: '204', building: 'A', floor: 'Second', type: 'Triple'),
  Room(number: '205', building: 'A', floor: 'Second', type: 'Triple'),
  Room(number: '206', building: 'A', floor: 'Second', type: 'Double'),
  Room(number: '207', building: 'A', floor: 'Second', type: 'Double'),
  Room(number: '208', building: 'A', floor: 'Second', type: 'Double'),
  Room(number: '209', building: 'A', floor: 'Second', type: 'Double'),

  // Building A - Third Floor
  Room(number: '301', building: 'A', floor: 'Third', type: 'Double'),
  Room(number: '302', building: 'A', floor: 'Third', type: 'Double'),
  Room(number: '303', building: 'A', floor: 'Third', type: 'Double'),
  Room(number: '304', building: 'A', floor: 'Third', type: 'Triple'),
  Room(number: '305', building: 'A', floor: 'Third', type: 'Triple'),
  Room(number: '306', building: 'A', floor: 'Third', type: 'Double'),
  Room(number: '307', building: 'A', floor: 'Third', type: 'Double'),
  Room(number: '308', building: 'A', floor: 'Third', type: 'Double'),

  // Building B - Ground Floor
  Room(number: '401', building: 'B', floor: 'Ground', type: 'Triple'),
  Room(number: '402', building: 'B', floor: 'Ground', type: 'Triple'),
  Room(number: '403', building: 'B', floor: 'Ground', type: 'Single'),
  Room(number: '404', building: 'B', floor: 'Ground', type: 'Double'),
  Room(number: '405', building: 'B', floor: 'Ground', type: 'Triple'),
  Room(number: '406', building: 'B', floor: 'Ground', type: 'Triple'),

  // Building B - Second Floor
  Room(number: '501', building: 'B', floor: 'Second', type: 'Triple'),
  Room(number: '502', building: 'B', floor: 'Second', type: 'Triple'),
];

int get totalRooms => noriasRooms.length;
