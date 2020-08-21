az account set --subscription "IoT Sales Technical Innovation"
az iot edge set-modules --device-id factory-01 --hub-name factory-ai-vision --content deploy.modules.json