## Get all Repos

This is a simple script to get all repo names and branches from an organization using the GraphQL API.


```json 
➜  org-getallrepos-graphql-pagination git:(main) ✗ ./org-getallrepos.sh | jq '[ .[0, 1] ]' -
[
  {
    "branch": "main",
    "name": ".github"
  },
  {
    "branch": "main",
    "name": "async-await-ale_hernandez_liberon-alu0101225562"
  }
]
```

```graphql
query($org:String!, $endCursor:String) {
  organization(login:$org) {
    repositories(first: 100, after: $endCursor, isFork:false, orderBy: {field:NAME, direction:ASC}) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        name
        defaultBranchRef {
          name
        }
      }
    }
  }
}
```

## Pagination in GraphQL

> **Warning** and more

> See <https://ull-mii-sytws.github.io/temas/introduccion-a-javascript/github-cli/gh-api-graphql.html#pagination>
>
> In `--paginate` mode, all pages of results will sequentially be requested until there are no more pages of results. 
>
> For GraphQL requests, this requires that 
>
> 1. the original query accepts an `$endCursor: String` variable and that 
> 2. it fetches the `pageInfo{ hasNextPage, endCursor }` set of fields from a collection.

