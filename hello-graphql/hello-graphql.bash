#!/bin/bash
gh api graphql --paginate -f query='query {
  organization(login: "nasa") {
    name
    url
  }
}
'