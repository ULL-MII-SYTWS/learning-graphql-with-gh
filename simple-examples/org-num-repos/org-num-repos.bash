#!/bin/bash
organizationname=$(gh pwd)
gh api graphql \
  -F organizationname=$organizationname \
  --field query=@org-num-repos.gql \
  --jq .data.organization.repositories.totalCount