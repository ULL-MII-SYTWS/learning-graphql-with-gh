To know about API Pagination and GraphQL Connections follow these links:

* <https://ull-mii-sytws.github.io/temas/introduccion-a-javascript/github-cli/gh-api-graphql.html#example-getting-issues
* <https://www.apollographql.com/blog/graphql/explaining-graphql-connections/>
* <https://ignaciochiazzo.medium.com/paginating-requests-in-apis-d4883d4c1c4c#:~:text=When%20exposing%20large%20data%20sets,endpoints%2C%20index%20endpoints%2C%20etc.>

```
➜  gh-graphql-connection-example git:(main) ./gh-api-example.bash                                                      
{
  "data": {
    "repository": {
      "issues": {
        "edges": [
          {
            "node": {
              "title": "Revisión",
              "url": "https://github.com/ULL-MII-SYTWS-2021/p01-t1-iaas-alu0101040882/issues/2",
              "labels": {
                "edges": [
                  {
                    "node": {
                      "name": "enhancement"
                    }
                  }
                ]
              }
            }
          }
        ]
      }
    }
  }
}
```