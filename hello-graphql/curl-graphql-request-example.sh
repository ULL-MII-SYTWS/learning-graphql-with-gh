curl -H "Authorization: bearer $GITHUB_TOKEN" -X POST -d ' 
 { 
   "query": "query { gh api graphql --paginate --field query=@findissueid.gqlviewer { login }}" 
 } 
' https://api.github.com/graphql
