#!/bin/bash
if [ -z "$1" ]
then
  organizationname="ULL-MII-SYTWS-2122"
else
  organizationname="$1"
fi

gh api graphql --paginate -F organizationname=$organizationname --field query=@org-num-repos.gql --jq .data.organization.repositories.totalCount