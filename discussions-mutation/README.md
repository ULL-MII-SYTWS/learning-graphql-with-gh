## Get Discussions in this repo

```json
➜  discussions-mutation git:(main) ./get-discussions.bash        
{
  "data": {
    "repository": {
      "discussions": {
        "edges": [
          {
            "node": {
              "id": "D_kwDOGLyMF84ARkhY",
              "number": 3,
              "body": "<!--\r\n    ✏️ Optional: Customize the content below to let your community know what you intend to use Discussions for.\r\n-->\r\n## 👋 Welcome!\r\n  We’re using Discussions as a place to connect with other members of our community. We hope that you:\r\n  * Ask questions you’re wondering about.\r\n  * Share ideas.\r\n  * Engage with other community members.\r\n  * Welcome others and are open-minded. Remember that this is a community we\r\n  build together 💪.\r\n\r\n  To get started, comment below with an introduction of yourself and tell us about what you do with this community.\r\n\r\n<!--\r\n  For the maintainers, here are some tips 💡 for getting started with Discussions. We'll leave these in Markdown comments for now, but feel free to take out the comments for all maintainers to see.\r\n\r\n  📢 **Announce to your community** that Discussions is available! Go ahead and send that tweet, post, or link it from the website to drive traffic here.\r\n\r\n  🔗 If you use issue templates, **link any relevant issue templates** such as questions and community conversations to Discussions. Declutter your issues by driving community content to where they belong in Discussions. If you need help, here's a [link to the documentation](https://docs.github.com/en/github/building-a-strong-community/configuring-issue-templates-for-your-repository#configuring-the-template-chooser).\r\n\r\n  ➡️ You can **convert issues to discussions** either individually or bulk by labels. Looking at you, issues labeled “question” or “discussion”.\r\n-->\r\n"
            }
          }
        ]
      }
    }
  }
}
```

## Get Comments in this Discussion

```json
➜  discussions-mutation git:(main) ✗ ./get-comments.bash         
{
  "data": {
    "repository": {
      "discussion": {
        "id": "D_kwDOGLyMF84ARkhY",
        "title": "Welcome to learning-graphql-with-gh Discussions!",
        "body": "<!--\r\n    ✏️ Optional: Customize the content below to let your community know what you intend to use Discussions for.\r\n-->\r\n## 👋 Welcome!\r\n  We’re using Discussions as a place to connect with other members of our community. We hope that you:\r\n  * Ask questions you’re wondering about.\r\n  * Share ideas.\r\n  * Engage with other community members.\r\n  * Welcome others and are open-minded. Remember that this is a community we\r\n  build together 💪.\r\n\r\n  To get started, comment below with an introduction of yourself and tell us about what you do with this community.\r\n\r\n<!--\r\n  For the maintainers, here are some tips 💡 for getting started with Discussions. We'll leave these in Markdown comments for now, but feel free to take out the comments for all maintainers to see.\r\n\r\n  📢 **Announce to your community** that Discussions is available! Go ahead and send that tweet, post, or link it from the website to drive traffic here.\r\n\r\n  🔗 If you use issue templates, **link any relevant issue templates** such as questions and community conversations to Discussions. Declutter your issues by driving community content to where they belong in Discussions. If you need help, here's a [link to the documentation](https://docs.github.com/en/github/building-a-strong-community/configuring-issue-templates-for-your-repository#configuring-the-template-chooser).\r\n\r\n  ➡️ You can **convert issues to discussions** either individually or bulk by labels. Looking at you, issues labeled “question” or “discussion”.\r\n-->\r\n",
        "comments": {
          "totalCount": 1,
          "edges": [
            {
              "node": {
                "id": "DC_kwDOGLyMF84AQN01",
                "body": "Esta es un comentario en la primera discusión.\r\nVamos a usar la API GraphQL para añadir comentarios",
                "replies": {
                  "edges": [
                    {
                      "node": {
                        "body": "Contador de cuerpo: 1",
                        "id": "DC_kwDOGLyMF84AQN4l"
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
}
```

## References

* [gist](https://gist.github.com/oleksis/d40a48a343b7e81fe0c6a940f086f43c)
* GitHub Docs  https://docs.github.com/en/graphql/guides/using-the-graphql-api-for-discussions#repositorydiscussions
* Feedbacks  https://github.com/github/feedback/discussions/43
* Discusion API  https://gist.github.com/smashwilson/311e1487ddb40a455fc54d294cc63ad4#adddiscussioncomment