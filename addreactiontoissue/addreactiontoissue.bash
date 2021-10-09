#!/bin/bash
# See
# https://docs.github.com/en/graphql/guides/forming-calls-with-graphql#example-mutation
# and
# https://docs.github.com/en/enterprise-server@3.0/graphql/guides/forming-calls-with-graphql
# for a list of supported emojis

reactionContentHelp() {
cat << HELPSTRING
                     ReactionContent Type
Emojis that can be attached to Issues, Pull Requests and Comments
-----------------------------------------------------------------
    CONFUSED Represents the :confused: emoji.
    EYES Represents the :eyes: emoji.
    HEART Represents the :heart: emoji.
    HOORAY Represents the :hooray: emoji.
    LAUGH Represents the :laugh: emoji.
    ROCKET Represents the :rocket: emoji.
    THUMBS_DOWN Represents the :-1: emoji.
    THUMBS_UP Represents the :+1: emoji.
HELPSTRING
}

findIssue() {
    local ISSUENUMBER
    if [ -n "$1" ]
    then
        ISSUENUMBER="$1"
    else
        ISSUENUMBER="1"
    fi
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
    gh api graphql --paginate -F num="$ISSUENUMBER" --field query=@findissueid.gql -q '.[].[].[].id'
}

case $1 in
-h | -H | --help ) reactionContentHelp
    exit
    ;;
esac

ISSUEID="$(findIssue "$1")"
shift
if [ -n "$1" ]
then
    emoji="$1"
else
    emoji="HEART"
fi
shift;

echo "Adding a reaction ${emoji} to issue with id '$ISSUEID'"

#
gh api graphql --paginate -F issueId="${ISSUEID}" -F emoji="${emoji}" --field query=@addreactiontoissue.gql

