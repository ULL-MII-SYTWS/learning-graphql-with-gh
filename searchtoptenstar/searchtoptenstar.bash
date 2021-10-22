# https://katopz.medium.com/how-to-search-with-github-graphql-e6c142dc61ed
gh api graphql --paginate \
   --field queryString="language:JavaScript stars:>10000" \
   --field query=@searchtoptenstar.gql