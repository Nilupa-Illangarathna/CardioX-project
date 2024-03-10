# CardioX Pre-Heart_Attack Detection System (Completed)

## Overview

The CardioX Pre-Heart_Attack Detection System is a comprehensive solution designed to detect potential heart attacks in patients four hours before they occur. This system employs a deep learning model, integrated with ESP32 and ECG sensors, to monitor and analyze patient data. The project includes a well-designed frontend, backend functionality, and real-time communication with Firebase for data synchronization.

## Project Progress

### Current Status
- The deep learning model is fully developed and operational.
- ESP32 and ECG sensors are successfully connected and functioning.
- The frontend design is complete, featuring different visual states for normal and emergency heart conditions.
- Firebase Realtime Database integration is implemented for communication with ESP32.
- Backend functionality is fully implemented.
- Data snapshots from the Firebase database are processed through a FastAPI ML model, providing accurate results.
- The entire system is fully functional, with the exception of the ESP32 connection to Firebase.

### To-Do
- Connect ESP32 to Firebase for real-time data synchronization.

## Project Components

### Deep Learning Model
The deep learning model responsible for heart attack prediction is located in the "DeepLearning model(Python)" folder within the project files.

### Frontend Design
View the frontend design in action:
#### When the patient is normal
https://user-images.githubusercontent.com/95247831/204505757-e9387e58-9748-4a44-be14-1a658dd8c7be.mp4

#### When the patient is in an emergency heart condition
https://user-images.githubusercontent.com/95247831/204505837-bc2f28ae-7621-4697-95d3-b708a5f1699e.mp4

#### Initial design (No design at all). (Now this design is not being used)
https://user-images.githubusercontent.com/95247831/203331275-a5e01acb-3f58-4399-8541-8affeac497ff.mp4

## Introduction Video
Watch an overview of the project: [Introduction Video](https://user-images.githubusercontent.com/95247831/206718769-263013df-324c-41a4-ae49-969fb2df0275.mp4)

## How to Run

1. Clone the repository.
2. Install necessary dependencies.
3. Run the system.



