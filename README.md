# Car Accident Detection and Recorder System

This project is a comprehensive car accident detection and recording system using Arduino Mega. The system is designed to detect potential accidents through sensors and send alerts to the vehicle owner or loved ones via SMS and phone calls. It also logs critical data leading up to and during the accident to aid in analysis.

## Features

- **Vibration Sensor:** Detects any impact force or heavy vibrations that could indicate a collision.
- **Temperature Sensor:** Detects potential fire in the vehicle and triggers an alert.
- **Gyroscope Sensor:** Records data when the vehicle tilts or turns over during an accident.
- **GPS Module:** Captures the location of the vehicle during an incident.
- **GSM Modem:** Sends SMS alerts with GPS coordinates and makes phone calls to the owner/loved ones.
- **Data Logging:** Stores all sensor readings leading up to and during the accident for later analysis.

## System Overview

The system integrates multiple sensors to monitor the vehicle's condition in real-time. When an accident or hazardous situation is detected, the Arduino Mega triggers the GSM module to send an SMS and make a phone call to the designated contacts. Additionally, the system stores all sensor data to help understand the circumstances of the accident.

## Components Used

- **Arduino Mega**
- **Vibration Sensor**
- **Temperature Sensor**
- **Gyroscope Sensor**
- **GPS Module**
- **GSM Modem**
- **Power Supply**

## Mobile Application

The system is complemented by a Flutter-based mobile application and an MIT App Inventor app. The mobile app allows users to monitor the system, receive real-time alerts, and view the vehicle's status. 

### Mobile App Features:

- Real-time accident alerts via SMS and phone calls.
- Displays vehicle GPS coordinates on a map.
- User-friendly interface for monitoring system status.

## Screenshots

<div style="display: flex; justify-content: space-between;">
  <div style="text-align: center;">
    <img src="https://github.com/JayarajChippada/Car-accident-detection-and-Recorder-box/blob/main/Screenshots/Login-Screen.jpg?raw=true" alt="Login Screen" width="200px"/>
    <p>Login Screen</p>
  </div>
  <div style="text-align: center;">
    <img src="https://github.com/JayarajChippada/Car-accident-detection-and-Recorder-box/blob/main/Screenshots/Home-Screen.jpg?raw=true" alt="Home Screen" width="200px"/>
    <p>Home Screen</p>
  </div>
  <div style="text-align: center;">
    <img src="https://github.com/JayarajChippada/Car-accident-detection-and-Recorder-box/blob/main/Screenshots/Home-Screen-Alert.jpg?raw=true" alt="Alert Notification" width="200px"/>
    <p>Alert Notification</p>
  </div>
  <div style="text-align: center;">
    <img src="https://github.com/JayarajChippada/Car-accident-detection-and-Recorder-box/blob/main/Screenshots/GPS-Screen.jpg?raw=true" alt="GPS" width="200px"/>
    <p>GPS</p>
  </div>
</div>

## Installation

1. **Arduino Setup:**
   - Install the necessary libraries for the GPS, GSM, and sensors.
   - Upload the Arduino code to your Arduino Mega.

2. **Flutter App Setup:**
   - Clone the mobile app repository.
   - Install Flutter and set up your development environment.
   - Run the app on an emulator or physical device.

3. **MIT App Inventor:**
   - Import the MIT App Inventor project.
   - Customize the blocks and design according to your requirements.

## Usage

- Power on the system in your vehicle.
- Ensure the mobile app is installed and connected.
- The system will monitor and send alerts automatically if any accident is detected.
- Review stored data for accident analysis.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request with your improvements or ideas.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
