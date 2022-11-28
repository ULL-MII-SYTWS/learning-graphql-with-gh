#!/bin/bash 
BODY="Contador de cuerpo: 4"
discussionId="D_kwDOGLyMF84ARkhY"
replyToId="DC_kwDOGLyMF84AQN01"
if [[ $# != 0 ]]; then
  BODY=$1
fi
gh api graphql \
-f body="Contador de cuerpo: $BODY" \
-F discussionId=$discussionId \
-F replyToId=$replyToId \
-f query='
mutation addComment($body: String!, $discussionId: ID!, $replyToId: ID!){
  addDiscussionComment(input:
    {
      body: $body , 
      discussionId: $discussionId, 
      replyToId: $replyToId 
    }
  )
  {
    comment{
      body
      id
    }
  }
}'