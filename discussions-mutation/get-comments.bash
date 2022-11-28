#!/bin/bash 
# Discussion 3 and comments
declare -i DISCUSSION_NUMBER=3

if [[ $# != 0 ]]; then
  DISCUSSION_NUMBER=$1
fi
gh api graphql \
-H 'GraphQL-Features: discussions_api' \
-F discussionNumber=${DISCUSSION_NUMBER} \
-F owner=':owner' \
-F name=':repo' \
-f query='query getComments($owner: String!, $name: String!, $discussionNumber: Int!) {
  repository(owner: $owner, name: $name) {
    discussion(number: $discussionNumber) {
      id
      title
      body
      comments(first: 10) {
        totalCount
        edges {
          node {
            id
            body
            replies(first: 5) {
              edges {
                node {
                  body
                  id
                }
              }
            }
          }
        }
      }
    }
  }
}
'
