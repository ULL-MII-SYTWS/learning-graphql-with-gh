#!/bin/bash 
# Get discussions in this repository
gh api graphql \
  -F owner=':owner' \
  -F name=':repo' \
  -f query='
query getDiscussions($owner: String!, $name: String!) {
  repository(owner: $owner, name: $name) {
    discussions(first: 10) {
      edges {
        node {
          id
          number
          body
        }
      }
    }
  }
}'
