# Device Manager

A ReactPy-based web application that displays network devices with their status (Online/Offline) by pinging them and cross-referencing with a local database.

![image Alt](https://raw.githubusercontent.com/FierSet/device-manager/refs/heads/main/screenshot/CAPTURE.png)

## Features

- **Device Status Monitoring**: Real-time device status (Online/Offline)
- **Database Integration**: SQLite database with device information
- **Web UI**: Built with ReactPy and FastAPI
- **PowerShell Integration**: Uses PowerShell scripts for device scanning
- **Responsive Design**: Bootstrap 5 styling with custom CSS

## Tech Stack

- **Backend**: FastAPI, Python 3.8+
- **Frontend**: ReactPy
- **Database**: SQLite3
- **Server**: Uvicorn (ASGI)
- **Device Scanning**: PowerShell (FastScan script)

## Project Structure

![Image Alt](https://raw.githubusercontent.com/FierSet/device-manager/refs/heads/main/screenshot/diagram.png)