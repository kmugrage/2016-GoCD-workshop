#!/bin/bash

echo export GO_SERVER_SYSTEM_PROPERTIES=\"-Dmaterial.update.idle.interval=2000 -Dcruise.material.update.interval=2000\" | sudo tee -a /etc/default/go-server

