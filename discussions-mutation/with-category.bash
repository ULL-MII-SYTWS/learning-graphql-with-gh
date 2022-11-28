# Discussions with category
gh api graphql \
  -H 'GraphQL-Features: discussions_api' \
  -F owner=':owner' \
  -F name=':repo' \
  -f query='
query($name: String!, $owner: String!) {
  repository(owner: $owner, name: $name) {
    discussions(first: 1){
      nodes{
        number title body category{id name}
      }
    }
  }
}'
