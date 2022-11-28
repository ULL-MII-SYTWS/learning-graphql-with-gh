#!/usr/bin/bash
# Mutation: Reply to discussion comment
gh api graphql -H 'GraphQL-Features: discussions_api' \
-f body='@Adilius We can make Github Action on the README.en.md file change and send a comment on this discussions with the mentioning the interested parties' \
-F discussionId='MDEwOkRpc2N1c3Npb24yMjU2MA==' \
-F replyToId='MDE3OkRpc2N1c3Npb25Db21tZW50ODk1OTg=' \
-f query='
mutation($body: String!, $discussionId: ID!, $replyToId: ID!){
  addDiscussionComment(input:{body: $body , discussionId: $discussionId, replyToId: $replyToId }){
    comment{id}
  }
}'
