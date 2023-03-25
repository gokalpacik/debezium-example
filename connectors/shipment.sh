#!/bin/bash

create_connector () {
    curl -X POST http://localhost:8083/connectors -d @shipment-connector.json \
        --header "Content-Type: application/json"
}

delete_connector () {
    curl -X DELETE http://localhost:8083/connectors/shipment-connector
        --header "Content-Type: application/json"
}

get_connectors (){
	curl -X GET http://localhost:8083/connectors 
}
"$@"
read