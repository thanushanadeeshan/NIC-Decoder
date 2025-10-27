##### 🪪 NIC Decoder - Flutter Application

##### 

##### 👨‍💻 Developer

##### Name: Thanusha Nadeeshan Akmeemana

##### Student Index: 22ug1-0391

##### Course: CCS3351 - Mobile Application Development

##### University: SLTC Research University

##### 

##### ---

##### 

##### 📱 Project Overview

##### The NIC Decoder App is a Flutter-based mobile application that decodes the Sri Lankan National Identity Card (NIC) number to reveal key personal details such as:

##### 

##### \- NIC Type (Old or New)

##### \- Date of Birth

##### \- Weekday of Birth

##### \- Age

##### \- Gender

##### \- Voting Eligibility (for old NICs)

##### 

##### This app uses Material UI for the interface and GetX for state management and navigation.

##### 

##### ---

##### 

##### 🧠 Features

##### ✅ Decode both Old (9-digit + letter) and New (12-digit) NIC formats

##### ✅ Automatically detect gender and voting eligibility

##### ✅ Display date of birth, weekday, and age

##### ✅ Uses GetX for state management and page navigation

##### ✅ Stores decoded NICs using GetStorage (local storage)

##### ✅ Clear history option

##### ✅ Simple, clean Material Design UI

##### 

##### ---

##### 

##### 🧩 Technologies Used

##### \- Flutter (Frontend UI)

##### \- GetX (State management and navigation)

##### \- intl (Date formatting)

##### \- GetStorage (Local data persistence)

##### \- Material Design (UI/UX)

##### 

##### ---

##### 

##### ⚙️ Project Structure

##### 

##### lib/

##### │

##### ├── main.dart # App entry point

##### │

##### ├── controllers/

##### │ └── nic\_controller.dart # Business logic and state management

##### │

##### ├── utils/

##### │ └── nic\_decoder.dart # NIC decoding logic

##### │

##### ├── screens/

##### │ ├── input\_screen.dart # NIC input screen

##### │ ├── result\_screen.dart # Display decoded results

##### │ └── history\_screen.dart # Show history of decoded NICs

##### │

##### └── pubspec.yaml # Dependencies

##### 

##### 

##### ---

##### 

##### 🚀 How to Run the Project

##### 

##### ```bash

##### Clone the repository

##### git clone https://github.com/thanushanadeeshan/NIC-Decoder.git

##### 

##### Navigate to project directory

##### cd NIC-Decoder

##### 

##### Get dependencies

##### flutter pub get

##### 

##### Run the app

##### flutter run

##### 

##### 🧾 Lessons Learned

##### 

##### Simplified state management and navigation with GetX.

##### 

##### Used the intl package for date formatting and age calculation.

##### 

##### Implemented input validation and real-time feedback for NIC entry.

##### 

##### Used GetStorage for storing decoded NIC history locally.

##### 

##### Gained hands-on experience fixing Flutter/Gradle setup issues.

##### 

##### 📚 License

##### 

##### This project is created for academic purposes only.

##### Unauthorized copying, modification, or redistribution is prohibited.

##### 

