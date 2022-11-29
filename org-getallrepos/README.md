See <https://ull-mii-sytws.github.io/temas/introduccion-a-javascript/github-cli/gh-api-graphql.html#pagination>

> **Note**
> In `--paginate` mode, all pages of results will sequentially be requested until there are no more pages of results. 

> **Warning**
> For GraphQL requests, this requires that 
>
> 1. the original query accepts an `$endCursor: String` variable and that 
> 2. it fetches the `pageInfo{ hasNextPage, endCursor }` set of fields from a collection.

