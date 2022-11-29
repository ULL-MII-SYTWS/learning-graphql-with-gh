#!/bin/bash
ORG=$(gh pwd)
if [[ -n $1 ]]; then ORG=$1; fi

gh api graphql --paginate \
    --jq '
    [
       .data
       .organization
       .repositories
       .nodes[] | 
       { branch: .defaultBranchRef.name, name: .name }
    ]
    ' \
    -F org=$ORG \
    -F query=@org-getallrepos.gql