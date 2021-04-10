#!/bin/bash

# copy all of the files into the scratch folder
cp -r "$GITHUB_WORKSPACE" /ns3/ns-allinone-${NS3_VERSION}/ns-${NS3_VERSION}/scratch/
cd  /ns3/ns-allinone-${NS3_VERSION}/ns-${NS3_VERSION}

# test build the app
./waf build


# run a test simulation to ensure that it runs if a parameter is set
if [[ -z "$INPUT_SIM_NAME" ]]
then
    echo "No simulation name given, not running a sample run"
else
    ./waf --run "scratch/workspace/$INPUT_SIM_NAME $INPUT_SIM_ARGS"
fi

