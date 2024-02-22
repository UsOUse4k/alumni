class Vacancy {
  final String id;
  final String companyName;
  final String companyLogo;
  final String salary;
  final String requirements;
  final String position;
  final Contacts contacts;
  final String? lastUpdate;
  final String updatedBy;

  Vacancy({
    required this.id,
    required this.companyName,
    required this.companyLogo,
    required this.salary,
    required this.requirements,
    required this.position,
    required this.contacts,
    this.lastUpdate,
    required this.updatedBy,
  });
}

class Contacts {
  final String whatsapp;
  final String telegram;
  final String email;

  Contacts({
    required this.whatsapp,
    required this.telegram,
    required this.email,
  });
}
