gh api graphql --paginate -f query='
query {
  __schema {
    types {
      name
      kind
      description
      fields {
        name
      }
    }
  }
}
'