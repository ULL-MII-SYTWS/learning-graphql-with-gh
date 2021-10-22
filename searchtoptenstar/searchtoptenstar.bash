gh api graphql --paginate \
   --field queryString="language:JavaScript stars:>10000" \
   --field query=@searchtoptenstar.gql