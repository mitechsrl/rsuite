#!/bin/bash

# Use this script to build & publish this package to our repo
if [ ! -f ".npmrc_mitech" ]; then
    echo "File .npmrc_mitech non esiste. Copia il file .npmrc da altri progetti e rinominalo come .npmrc_mitech. Deve contenere le credenziali di accesso al repository npm mitech."
    exit 0;
fi

npm run build
cp .npmrc_mitech ./lib/.npmrc
cp .npmignore ./lib/.npmignore
cd ./lib
npm publish --registry https://mitech-npm.westeurope.cloudapp.azure.com/ --access restricted
cd ..
rm ./lib/.npmrc
rm ./lib/.npmignore
