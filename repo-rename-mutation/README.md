## About mutations

Every GraphQL schema has a root type for both queries and mutations. 

The [mutation type](https://graphql.github.io/graphql-spec/June2018/#sec-Type-System) defines GraphQL operations that change data on the server. 

It is analogous to performing HTTP verbs such as `POST`, `PATCH`, and `DELETE`.

## References

* See SYTWS notes at 
<https://sytws.netlify.app/practicas/gh-cli/#rename-a-repo> for more info.
* The GH GraphQL documentation for the mutation `updateRepository`: <https://docs.github.com/en/graphql/reference/mutations#updaterepository>
  
## Examples

- See [rename_repo.sh](rename_repo.sh) for more info.
- See [rename.gql](rename.gql) for more info.

## Some gh alias used in this examples

```
repo-rename-mutation git:(main) gh alias list | grep pwd
pwd:    !gh config get current-org
pwd-lab:        !gh config get current-lab
```

```
➜  repo-rename-mutation git:(main) gh alias list | grep cd 
cd:     !gh config set current-org "$1" 2>/dev/null
cd-lab: !gh config set current-lab "$1" 2>/dev/null
```

## Altair GraphQL Client

Request saved in Altair GraphQL Client

* [github_graphql_examples.agc](github_graphql_examples.agc)
* [github_graphql_examples.agc.json](github_graphql_examples.agc.json)