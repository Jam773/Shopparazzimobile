Shopparazzi Mobile Application README


Frontend and Backend: React Native, Node.js, Express.js
Database: MySQL
Emulator: Android Studio with Expo

Prerequisites

Before you start, ensure you have the following installed:

Node.js: Download Node.js
Expo CLI: Install Expo CLI globally using "npm install -g expo-cli"
Android Studio: Download Android Studio
MySQL: Download MySQL

Setting Up the Project

1. Clone the Repository
2. Install Dependencies using  "npm install"
3. Set Up the Database

I) Start MySQL Server: Ensure your MySQL server is running.
II) Import Database Schema:
	*Locate the shopparazzi_db.sql file in the root directory.
	*Use a MySQL client (e.g., MySQL Workbench) to run the shopparazzi_db.sql script to set up the database schema. You can use the following 	
	command in the terminal as well:

		"mysql -u root < shopparazzi_db.sql"

III) Configure Database Connection:

Update the server.js file with the MySQL database credentials. 

4. Update IP Address in the Project
Some screens in the project require the IP address of your local computer. Update the IP address in the relevant files:

I) Find Your Local IP Address:
	*On Windows, open Command Prompt and type "ipconfig", then find the IPv4 address.
	*On macOS or Linux, open Terminal and type "ifconfig" or "ip a", then find the IP address.

II)Update IP Address and Port in Project Files:
	*Open the project in your code editor.
	*Find the following files in which the IP address needs to be updated. These are  in the /src/screens directory.

		ComparePriceScreen.js
		ExploreScreen.js
		LoginScreen.js
 
	*Replace any placeholder IP addresses with your local IP address and ensure the port is set to 3002 or another available port.

Running the Project

1. Start the Backend Server

In the project root directory, run:
	"node server.js"

This will start the backend server on port "3002".

2. Open the Emulator

I) Open Android Studio.
II) Launch the Android Virtual Device (AVD) from the AVD Manager.

3. Start the Frontend Application

In the project root directory, run:
	"npx expo start"

This will start the Expo development server.

4. Open the App in the Emulator:

With the emulator already running, you can then press "a" in the terminal where the Expo development server is running. This will open the app in 
the Android emulator.

