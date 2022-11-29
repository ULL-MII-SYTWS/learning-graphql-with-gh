#!/bin/bash
ORG="ULL-MII-SYTWS-2021" 
LAB="p01-t1-iaas-alu0101040882"

POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    -o|--org)
     ORG=$2
     shift # past argument
     shift # past value
     ;;
    -l|--lab)
      LAB=$2
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "USAGE"
      echo "  $0 [options]"
      echo "Available options:"
      echo "  -o --ORG <GitHub Organization>"
      echo "  -l --lab <repository>"
      echo "Example:"
        echo "  $0 -o \"$ORG\" -l \"$LAB\""
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

gh api graphql --paginate -F owner="$ORG" -F lab="$LAB" -F query=@gh-api-example.gql $POSITIONAL_ARGS