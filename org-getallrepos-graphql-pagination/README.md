## Get all Repos


This is a simple script to get all repo names and branches from an organization using the GraphQL API.


```
➜  org-getallrepos-graphql-pagination git:(main) ✗ ./org-getallrepos.sh | jq '[ .[0, 1] ]' -
```
```json
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

See [org-getallrepos.sh](org-getallrepos.sh) for more info.

### File `org-getallrepos.gql`

Here are the contents of the file [org-getallrepos.gql](org-getallrepos.gql):

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

See 

* <https://ull-mii-sytws.github.io/temas/introduccion-a-javascript/github-cli/gh-api-graphql.html#pagination>
* <https://graphql.org/learn/pagination/>

When using the `gh` cli in `--paginate` mode, all pages of results will sequentially be requested until there are no more pages of results. For GraphQL requests, this requires that 

1. The original query accepts an `$endCursor: String` variable and that 
2. It fetches the `pageInfo{ hasNextPage, endCursor }` set of fields from a collection.

## Altair GraphQL Client

Request saved in Altair GraphQL Client

![REPO RENAME Altair GraphQL Client](/images/altair-allrepos.png)
* [/altair-graphql/github_graphql_examples.agc](/altair-graphql/github_graphql_examples.agc)
* [/altair-graphql/github_graphql_examples.agc.json](/altair-graphql/github_graphql_examples.agc.json)