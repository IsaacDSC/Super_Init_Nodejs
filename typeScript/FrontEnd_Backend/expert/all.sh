#!/bin/bash
sh ./auto/gen/dependences.sh

sh ./auto/gen/paths_folders.sh

sh ./auto/gen/environment_variables.sh

sh ./auto/gen/server_aplication.sh

sh ./auto/gen/@types/typescript.sh

sh ./auto/gen/docker.sh







