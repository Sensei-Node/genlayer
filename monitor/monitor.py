import sys
import os
import requests

from flask import Flask
from prometheus_client import Gauge, generate_latest, CONTENT_TYPE_LATEST
from dotenv import load_dotenv


load_dotenv()

app = Flask(__name__)

service_status_gauge = Gauge(
    "service_status", "Status of services", ["service", "address", "timestamp"]
)

VALIDATOR_ADDRESS = os.environ.get("VALIDATOR_ADDRESS", "0x0")

if VALIDATOR_ADDRESS is None:
    sys.exit("please configure the env var ADDRESS with your validator address")


def get_node_status():
    try:
        response = requests.get("http://genlayer:9153/health")
        response.raise_for_status()
        data = response.json()

        zksync_timestamp = data["details"]["zksync"]["timestamp"]
        zksync_websocket_timestamp = data["details"]["zksync-websocket"]["timestamp"]

        global_status = 1.0 if data["status"] == "up" else 0
        zksync_status = 1.0 if data["details"]["zksync"]["status"] == "up" else 0
        zksync_websocket_status = (
            1.0 if data["details"]["zksync-websocket"]["status"] == "up" else 0
        )
        return (
            global_status,
            zksync_status,
            zksync_websocket_status,
            zksync_timestamp,
            zksync_websocket_timestamp,
        )
    except Exception as e:
        print(f"⚠️ Error al llamar al endpoint: {e}")
        # Return zero values and "0" timestamps if request fails
        return 0, 0, 0, "0", "0"


def update_metrics():
    result = get_node_status()
    (
        global_status,
        zksync_status,
        zksync_websocket_status,
        zksync_timestamp,
        zksync_websocket_timestamp,
    ) = result
    service_status_gauge.labels(
        service="global", address=VALIDATOR_ADDRESS, timestamp="0"
    ).set(global_status)
    service_status_gauge.labels(
        service="zksync", address=VALIDATOR_ADDRESS, timestamp=zksync_timestamp
    ).set(zksync_status)
    service_status_gauge.labels(
        service="zksync-websocket",
        address=VALIDATOR_ADDRESS,
        timestamp=zksync_websocket_timestamp,
    ).set(zksync_websocket_status)


@app.route("/metrics")
def metrics():
    update_metrics()
    return generate_latest(), 200, {"Content-Type": CONTENT_TYPE_LATEST}


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
