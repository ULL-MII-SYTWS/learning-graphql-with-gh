#!/bin/bash

help() {
cat << HELP
To know about API Pagination and GraphQL Connections follow these links:

    * <https://www.apollographql.com/blog/graphql/explaining-graphql-connections/>
    * <https://ignaciochiazzo.medium.com/paginating-requests-in-apis-d4883d4c1c4c#:~:text=When%20exposing%20large%20data%20sets,endpoints%2C%20index%20endpoints%2C%20etc.>

HELP
}

case $1 in
-h | -H | --help ) help
    exit
    ;;
esac

gh api graphql --paginate -F query=@gh-api-example.gql $@