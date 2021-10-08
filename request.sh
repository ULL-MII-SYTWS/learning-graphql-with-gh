curl -H "Authorization: bearer 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" -X POST -d " \
 { \
   \"query\": \"query { viewer { login }}\" \
 } \
" https://api.github.com/graphql
