See <https://sytws.netlify.app/practicas/gh-cli/#rename-a-repo> for more info.

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

## requirement

install gh extension org-browse-repo

## Altair GraphQL Client

Request saved in Altair GraphQL Client

* [github_graphql_examples.agc](github_graphql_examples.agc)
* [github_graphql_examples.agc.json](github_graphql_examples.agc.json)