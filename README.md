🪪 NIC Decoder App

A Flutter-based mobile application developed for the CCS3351 Mobile Application Development final project.
This app decodes the Sri Lankan National Identity Card (NIC) number to extract important details such as Date of Birth, Gender, Age, and Voting Eligibility, supporting both old and new NIC formats.

🚀 Features

- Input Screen: Allows users to enter the NIC number and decode it.
- Result Screen: Displays decoded details including date of birth, weekday, age, gender, and NIC type.
- History Screen: Saves previously decoded NICs and allows clearing history.
- Validation: Detects and displays warnings for incorrect NIC formats.
- Local Storage: Uses GetStorage to store decoded history locally.
- Navigation: Powered by GetX for smooth screen transitions and state management.

🧱 Project Structure

lib/
│
├── main.dart                    # Entry point of the app, initializes routes
│
├── controllers/
│   └── nic_controller.dart      # Handles decoding logic, validation, and storage
│
├── screens/
│   ├── input_screen.dart        # Input screen for NIC entry
│   ├── result_screen.dart       # Shows decoded NIC results
│   └── history_screen.dart      # Displays previously decoded NICs
│
└── utils/
    └── nic_decoder.dart         # Core NIC decoding algorithm

🧩 Technologies Used

- Flutter – For building the app UI
- Dart – Core programming language
- GetX – State management and navigation
- GetStorage – Persistent local storage
- intl – For date formatting and weekday extraction

📦 Installation & Setup

Follow these steps to run the app locally:

1. Clone the Repository
   git clone https://github.com/thanushanadeeshan/NIC-Decoder.git

2. Navigate to the Project Folder
   cd NIC-Decoder

3. Install Dependencies
   flutter pub get

4. Run the Application
   flutter run

🖥️ Screens Overview

Screen           Description
Input Screen     Enter NIC number and decode it instantly.
Result Screen    View decoded NIC details such as DOB, Gender, Age, etc.
History Screen   Review and delete previously decoded NIC entries.

🧠 Lessons Learned

- Learned how GetX simplifies state management and navigation in Flutter.
- Used the intl package to handle date formatting and weekday names.
- Implemented user input validation for accurate NIC decoding.
- Used GetStorage for saving and retrieving local data.
- Solved build and Gradle-related issues during Android setup.

⚙️ Algorithm (Simplified)

1. Get NIC input from the user.
2. Check if NIC format is old (10 digits) or new (12 digits).
3. Extract birth year and day of year.
4. Determine gender (if day > 500 → female).
5. Calculate date of birth and weekday.
6. Identify voting eligibility (for old NICs).
7. Display results and save them to history.

🌐 GitHub Repository

GitHub - thanushanadeeshan/NIC-Decoder

👨‍💻 Author

Thanusha Nadeeshan Akmeemana
BSc (Hons) in Cyber Security — SLTC Research University
Index No: 22ug1-0391
📧 Email: thanushanadeeshan1@gmail.com
📞 Phone: 0711604538

📅 Submission Details

Course: CCS3351 - Mobile Application Development
Project: Final Project — NIC Decoder App
Submission Date: 2025/03/02
