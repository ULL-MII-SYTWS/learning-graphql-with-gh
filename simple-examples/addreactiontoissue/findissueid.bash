#!/bin/bash
#set -x
if [ -n "$1" ] 
then
ISSUENUMBER="$1"
else 
ISSUENUMBER="1"
fi
shift
# {
#  "data": {
#    "repository": {
#      "issue": {
#        "id": "I_kwDOGLyMF84838wt"
#      }
#    }
#  }
#}
#
gh api graphql --paginate -F num="$ISSUENUMBER" --field query=@findissueid.gql
