import os
import sys

DEFAULT_USER = os.getlogin()
SERVICES = {
    "spre": {
        "default": {"host": "wrds-labs-w", "user": "spre"},
        "prod": {"host": "10.152.146.6", "user": "spre"},
    },
    "wds": {
        "default": {"host": "wrds-labs-w", "user": "wds"},
        "prod": {"host": "10.152.146.59", "user": "wds"},
    },
    "wrds-data": {"default": {"host": "wrds-sbd-data-01-w"}},
}

if len(sys.argv) < 2 or sys.argv[1] not in SERVICES:
    print("Usage: ssh.py <service> [<environment>] [<user>]")
    print("Available servers:")
    for service in SERVICES:
        print(f"  {service}")
    sys.exit(1)

service = sys.argv[1]
if len(sys.argv) >= 3:
    environment = sys.argv[2]
else:
    environment = "default"

host = SERVICES[service][environment]["host"]

if len(sys.argv) >= 4:
    user = sys.argv[3]
else:
    user = SERVICES[service][environment].get("user", DEFAULT_USER)

os.execvp("ssh", ["ssh", f"{user}@{host}"])
