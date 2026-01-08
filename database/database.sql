Drop TABLE IF EXISTS devices;

CREATE TABLE devices (
    mac_address VARCHAR(17) UNIQUE NOT NULL,
    SN VARCHAR(100),
    asset_type VARCHAR(50),
    comment TEXT,
    last_ping TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO devices (mac_address, SN, asset_type, comment) VALUES
('00:1A:2B:3C:4D:5E', 'SN123456', 'Laptop', 'Office laptop'),
('11:22:33:44:55:66', 'SN654321', 'Desktop', 'Workstation PC'),
('AA:BB:CC:DD:EE:FF', 'SN112233', 'Server', 'Database server'),
('9C:2F:4E:C2:EA:BD', '000000003f74bba8','Camera','Camera WIFI'),
('77:88:99:AA:BB:CC', 'SN445566', 'Router', 'Main office router'),
('DD:EE:FF:00:11:22', 'SN778899', 'Switch', 'Network switch'),
('33:44:55:66:77:88', 'SN990011', 'Printer', 'Office printer'),
('99:AA:BB:CC:DD:EE', 'SN223344', 'Tablet', 'Field tablet device'),
('45:67:89:AB:CD:EF', 'SN112244', 'Projector', 'Conference room projector'),
('BC:DE:F0:12:34:56', 'SN334466', 'Scanner', 'Document scanner device'),
('78:9A:BC:DE:F0:12', 'SN556688', 'Modem', 'Internet modem device'),
('90:AB:CD:EF:01:23', 'SN778800', 'UPS', 'Uninterruptible Power Supply'),
('34:56:78:9A:BC:DE', 'SN990033', 'Workstation', 'High-performance workstation'),
('CD:EF:01:23:45:67', 'SN001133', 'Thin Client', 'Lightweight thin client device'),
('56:78:9A:BC:DE:F0', 'SN223355', 'KVM Switch', 'Keyboard Video Mouse switch device'),
('EF:01:23:45:67:89', 'SN445577', 'Docking Station', 'Laptop docking station'),
('67:89:AB:CD:EF:01', 'SN667799', 'External HDD', 'External hard drive device'),
('12:34:56:78:9A:BC', 'SN889911', 'Webcam', 'USB webcam device'),
('AB:CD:EF:01:23:45', 'SN001144', 'Headset', 'Office headset device'),
('23:45:67:89:AB:CD', 'SN223366', 'Microphone', 'Conference room microphone'),
('DE:AD:BE:EF:CA:FE', 'SN334477', 'Graphics Tablet', 'Digital graphics tablet device'),
('FE:ED:FA:CE:BE:EF', 'SN556699', 'VR Headset', 'Virtual reality headset device'),
('BA:AD:F0:0D:CA:FE', 'SN778811', '3D Printer', 'Office 3D printer device'),
('0D:15:E5:7E:D0:0D', 'SN990044', 'Smart TV', 'Conference room smart TV device'),
('C0:FF:EE:C0:FF:EE', 'SN001155', 'Media Player', 'Digital media player device'),
('FA:CE:B0:0C:AB:1E', 'SN223377', 'Digital Signage', 'Office digital signage device'),
('BE:EF:CA:FE:BA:BE', 'SN334488', 'E-Reader', 'Company e-reader device'),
('AB:BA:AB:BA:AB:BA', 'SN556700', 'Smartwatch', 'Employee smartwatch device'),
('DE:CA:FB:AD:DE:CA', 'SN778822', 'Fitness Tracker', 'Company fitness tracker device'),
('FE:ED:DE:AD:FE:ED', 'SN990055', 'Gaming Console', 'Recreation room gaming console device');

