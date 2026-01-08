import shutil
import asyncio
import sqlite3
from pathlib import Path
import shutil, subprocess, sqlite3, os, re
import os
import re

def check_asset():

    ps = shutil.which("pwsh") or shutil.which("powershell")
    script = os.path.abspath(r"..\devices_ping\deviceping.ps1")
    cmd = [ps, "-NoProfile", "-NonInteractive", "-Command", f". '{script}'; FastScan"]

    proc = subprocess.run(cmd, capture_output=True, text=True)
    out = proc.stdout
    err = proc.stderr

    if err:
        return ["Error", err]
    
    # Updated regex to capture MACs with hyphens and IPs (IPv4/IPv6)
    match = re.findall(r"MAC:\s*([\w\-:]+),\s*IP:\s*([\w\.:]+)", out)
    #print("Regex matches:", len(match), "device(s)")
    device_list = [{"MAC": mac, "IP": ip} for mac, ip in match]
    
    return device_list

devices = check_asset()
for device in devices:
    print(device)

def connect_database():
    db_file = Path("database/devices.db")
    result = None
    
    try:
        conn = sqlite3.connect( db_file)
        conn.row_factory = sqlite3.Row
        with conn:
            result = [dict(row) for row in conn.execute("SELECT * FROM devices")]
            
        #for row in result:
        #  print(row['mac_address'], row['SN'])
    finally:
        conn.close()

    return result

#connect_database()