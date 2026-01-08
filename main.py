from fastapi.responses import HTMLResponse
from reactpy import component, html
from fastapi.staticfiles import StaticFiles
from reactpy.backend.fastapi import configure
from reactpy import component, html, hooks
from fastapi import FastAPI
import asyncio
import callapi

@component
def table_row(devices):

    return html.table(
        html.tr(
            html.th("MAC"),
            html.th("SN"),
            html.th("Type"),
            html.th("Comment"),
            html.th("Status")    
        ),

        html.tbody(
            [
                html.tr(
                {"class": "status-online" if device.get("status") == "Online" else "status-offline"},   
                html.td(device.get("mac_address", "")),
                html.td(device.get("SN", "")),
                html.td(device.get("asset_type", "")),
                html.td(device.get("comment", "")),
                html.td(device.get("status", ""))
                )
                for device in devices
            ]
        )
    )

@component
def main():

    devices, set_devices = hooks.use_state([])

    async def load():
        
        devicesping = await asyncio.to_thread(callapi.check_asset)

        database_devices = await asyncio.to_thread(callapi.connect_database)

        #print("Fetched pinged devices:", devicesping)
        #print("Fetched devices from database:", database_devices) 
        out = []
        for d in database_devices:
            mac = d.get("mac_address","")
            d["status"] = "Offline"
            for p in devicesping:
                if mac and p.get("MAC","").lower().replace("-",":") == mac.lower().strip():
                    d["status"] = "Online"
                    break
            out.append(d)
        set_devices(out)

    def start():
        task = asyncio.create_task(load())
        def cleanup():
            if not task.done():
                task.cancel()
        return cleanup

    hooks.use_effect(start, [])

    return html._(
        html.head(
            html.title("Device Manager"),
            html.link({
                "href" : "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css",
                "rel" : "stylesheet", 
                "integrity" : "sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD", 
                "crossorigin" : "anonymous",
            }),
            html.link({
                "rel":"stylesheet",
                "href":"/static/styles.css"
            })
        ),
        html.div(
            {"class":"table-container"},
            html.h1("Device Manager"),
            table_row(devices)
        ),
    )

app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")



configure(app, main)