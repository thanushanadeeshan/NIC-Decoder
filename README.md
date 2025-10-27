NIC Decoder App

A Flutter-based mobile application developed for the CCS3351 Mobile Application Development final project.
This app decodes the Sri Lankan National Identity Card (NIC) number to extract personal details such as Date of Birth, Gender, Age, and Voting Eligibility, supporting both old and new NIC formats.

Features

Input Screen — Enter NIC number and decode instantly.

Result Screen — Displays decoded details:

NIC Type (Old or New)

Date of Birth

Day of the Week

Age

Gender

Voting Eligibility (for old NICs)

History Screen — View and delete previously decoded NICs.

Validation — Detects invalid or incorrectly formatted NIC numbers.

Local Storage — Stores decoded history using GetStorage.

GetX Navigation — Smooth transitions between screens.

Project Structure
lib/
│
├── main.dart                   # Entry point of the app, initializes routes
│
├── controllers/
│   └── nic_controller.dart     # GetX controller handling logic & state
│
├── screens/
│   ├── input_screen.dart       # User input screen with NIC field
│   ├── result_screen.dart      # Shows decoded NIC results
│   └── history_screen.dart     # Displays decoding history
│
└── utils/
    └── nic_decoder.dart        # Core NIC decoding logic

Technologies Used

Flutter — UI Framework for mobile development.

Dart — Programming language used to build Flutter apps.

GetX — For state management, routing, and reactivity.

GetStorage — Lightweight local database for persistent storage.

intl — For date formatting and weekday conversion.

Installation & Setup

Follow these steps to run the app locally:

Clone the Repository

git clone https://github.com/thanushanadeeshan/NIC-Decoder.git


Navigate to the Project Folder

cd NIC-Decoder


Install Dependencies

flutter pub get


Run the Application

flutter run

Screens Overview
Screen	Description
Input Screen	Allows the user to enter a NIC number and decode it.
Result Screen	Displays decoded NIC details (DOB, Gender, Age, etc.).
History Screen	Shows stored decoding history with delete options.
Lessons Learned

Learned how GetX simplifies state management and navigation in Flutter.

Used the intl package to format and calculate dates from the NIC.

Implemented user input validation for NIC formats.

Stored decoded NIC data using GetStorage for local persistence.

Solved common Flutter issues with dependencies and Gradle setup.

Algorithm (Simplified)

Get NIC input.

Detect if NIC is old (10 characters) or new (12 characters).

Extract year and day of year.

Determine gender (day > 500 → female).

Calculate date of birth and weekday.

Determine voting eligibility (for old NICs).

Display results and save to history.

GitHub Repository

https://github.com/thanushanadeeshan/NIC-Decoder

Author

Thanusha Nadeeshan Akmeemana
BSc (Hons) in Cyber Security — SLTC Research University
Index No: 22ug1-0391
Email: thanushanadeeshan1@gmail.com

Phone: 0711604538

Submission Details

Course: CCS3351 - Mobile Application Development
Project: Final Project — NIC Decoder App
Submission Date: 2025/03/02
