gh api graphql --paginate -f query='
query {
  __type(name: "Repository") {
    name
    kind
    description
    fields {
      name
    }
  }
}
'