// lib/utils/nic_decoder.dart
import 'package:intl/intl.dart';

/// A utility class to decode Sri Lankan NIC numbers.
///
/// This class provides a static method [decodeNIC] that extracts key details
/// from a given NIC number, such as birth date, age, gender, and voting eligibility

class NICDecoder {
  /// Decodes a Sri Lankan NIC number and extracts details.
  ///
  /// This method supports both:
  /// - **Old NIC Format** (9-digit + 'V' or 'X', e.g., `853400937V`)
  /// - **New NIC Format** (12-digit, e.g., `199534000937`)
  ///
  /// Returns a `Map<String, dynamic>` containing:
  /// - `NIC Type`: Old or New format
  /// - `Date of Birth`: Formatted as YYYY-MM-DD
  /// - `Weekday`: Day of birth (e.g., Monday)
  /// - `Age`: Current age based on the year
  /// - `Gender`: Male or Female
  /// - `Serial Number`: The NIC serial number
  /// - `Vote Eligibility`: Only for old NICs ('V' = Can Vote, 'X' = Cannot Vote)

  static Map<String, dynamic> decodeNIC(String nic) {
    final isNewFormat = nic.length == 12;
    String birthYear;
    int dayOfYear;
    String serialNumber;
    String voteEligibility = "Unknown";

    if (isNewFormat) {
      birthYear = nic.substring(0, 4);
      dayOfYear = int.parse(nic.substring(4, 7));
      serialNumber = nic.substring(7, 12);
    } else {
      birthYear = "19${nic.substring(0, 2)}";
      dayOfYear = int.parse(nic.substring(2, 5));
      serialNumber = nic.substring(5, 9);
      voteEligibility = nic[9] == 'V' ? "Can Vote" : "Cannot Vote";
    }

    final gender = dayOfYear < 500 ? "Male" : "Female";
    final adjustedDay = gender == "Female" ? dayOfYear - 500 : dayOfYear;

    final baseDate = DateTime(int.parse(birthYear), 1, 1);
    final dob = baseDate.add(Duration(days: adjustedDay - 1));

    if (dob.year != int.parse(birthYear)) {
      throw Exception("Invalid day of year");
    }

    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }

    return {
      "NIC Type": isNewFormat ? "New Format" : "Old Format",
      "Date of Birth": DateFormat('yyyy-MM-dd').format(dob),
      "Weekday": DateFormat('EEEE').format(dob),
      "Age": age,
      "Gender": gender,
      "Serial Number": serialNumber,
      if (!isNewFormat) "Vote Eligibility": voteEligibility,
    };
  }
}
