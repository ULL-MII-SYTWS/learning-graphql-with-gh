# https://katopz.medium.com/how-to-search-with-github-graphql-e6c142dc61ed
# Does not work when using GRaphiQL (timeout). May be needs a token with privileges?
# try also: https://docs.github.com/es/graphql/overview/explorer
gh api graphql --paginate \
   --field queryString="language:JavaScript stars:>10000" \
   --field query=@searchtoptenstar.gql