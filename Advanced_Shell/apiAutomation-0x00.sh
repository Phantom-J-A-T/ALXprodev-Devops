#!/bin/bash

# Defining the Variables
POKEMON_NAME = "pikachu"
API_URL = "https://pokeapi.co/api/v2/pokemon/${POKEMON_NAME}"
DATA_FILE = "output.json"
ERROR_LOG = "erorrs.txt"

# Make the API request
curl -s "${API_URL}" > "${DATA_FILE}"

# Check the Exit Status
if [ $? -ne 0]; then
	echo "Request failed for ${POKEMON_NAME} at $(date)" >> "${ERROR_LOG}"
	rm -f "${DATA_FILE}" #Removes the empty or innncomplete file after failure
	echo "ERROR: See ${ERROR_LOG} for details."
else
	echo "Successfully retrieved data and saved to ${DATA_FILE}."
fi
