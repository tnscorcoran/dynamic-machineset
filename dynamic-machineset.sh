#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 inputfile infrastructure_id instanceType availabilityZone region ami"

}

# Check if correct number of arguments provided
if [ "$#" -ne 6 ]; then
    usage
    echo "bad usage"
fi


input_file=$1
infrastructure_id=$2
instanceType=$3
region=$4
availabilityZone=$5
ami=$6

echo Input file $input_file
echo infrastructure_id $infrastructure_id
echo instanceType $instanceType
echo region $region
echo availabilityZone $availabilityZone
echo ami $ami


# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file $input_file does not exist."
    exit 1
fi



# Perform the replacement

sed -i.bak -e "s/your_infrastructure_id/$infrastructure_id/g" -e "s/your_instanceType/$instanceType/g" -e "s/your_region/$region/g" -e "s/your_availabilityZone/$availabilityZone/g" -e "s/your_ami/$ami/g" "$input_file"

echo "Replacement complete. Check $input_file for the updated content."
