#!/bin/bash
# See
# https://docs.github.com/en/graphql/guides/forming-calls-with-graphql#example-mutation 
# and
# https://docs.github.com/en/enterprise-server@3.0/graphql/guides/forming-calls-with-graphql
# for a list of supported emojis
gh api graphql --paginate --field query=@addreactiontoissue.gql 
