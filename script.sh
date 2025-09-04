# first i want to get input's:
# Environment={deployment, staging, production}
# region = {america, india}
# zone = {america-1, america-2, india-1, india-2}

# validation of input's
# Enviroment == deployment || staging || production
# region == america || india 
# if region is america it's take zone == america-1 || america-2
# if india it's take zone == india-1 || india-2

#!/bin/bash
environments=("deployment" "staging" "production")
regions=("america" "india")
zones=("america-1" "america-2" "india-1" "india-2")


Args=$(getopt -o e:r:z: --long environment:,region:,zone: -n "$0" -- "$@")

if [ $? -ne 0 ]; then
    echo "Error in command line arguments"
    echo "Enter input like this: $0 -e <environment> -r <region> -z <zone>"
    exit 1
fi

eval set -- "$Args"

while true; do
    case "$1" in 
        -e|--environment)
            environment="$2"
            shift 2
            ;;
        -r|--region)
            region="$2"
            shift 2
            ;;
        -z|--zone)
            zone="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Internal error!"
            exit 1
            ;;
    esac

done


echo "environment: $environment"
echo "region: $region"
echo "zone: $zone"


# Validate environment
if [[ ! "${environments[@]}" =~ "${environment}" ]]; then
    echo "Invalid environment. Choose from: ${environments[*]}"
    exit 1
fi  
# Validate region
if [[ ! " ${regions[@]} " =~ " ${region} " ]]; then
    echo "Invalid region. Choose from: ${regions[*]}"
    exit 1
fi
# Validate zone based on region
if [[ "$region" == "america" ]]; then
    if [[ ! " ${zones[@]} " =~ " ${zone} " ]] || [[ "$zone" != america-* ]]; then
        echo "Invalid zone for america. Choose from: america-1, america-2"
        exit 1
    fi
elif [[ "$region" == "india" ]]; then
    if [[ ! " ${zones[@]} " =~ " ${zone} " ]] || [[ "$zone" != india-* ]]; then
        echo "Invalid zone for india. Choose from: india-1, india-2"
        exit 1
    fi
fi      
echo "All inputs are valid."
