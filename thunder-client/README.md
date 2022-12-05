# Thunder client for VSCode

[Thunder Client](https://github.com/rangav/thunder-client-support#thunder-client) is a lightweight Rest API Client Extension for Visual Studio Code. You can use it to prepare and test your REST API requests.

See <https://github.com/rangav/thunder-client-support> for more information.

## github rest api/contents/addfile

See the REST API docs at <https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#create-or-update-file-contents>.

```js
let headersList = {
 "Accept": "application/vnd.github+json",
 "User-Agent": "Thunder Client (https://www.thunderclient.com)",
 "Authorization": "Bearer "+processs.env.GITHUB_TOKEN,
 "Content-Type": "application/json"
}

let bodyContent = JSON.stringify({ 
  "message": "my 2nd commit message",
  "sha": "2c13ec52edd7aab95efafcd12decd7227b6787da", // get the previous sha of the file
  "content": btoa("Hello world 2!. \n<https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28>")
});

let response = await fetch("https://api.github.com/repos/crguezl/prueba-interfaz.web/contents/README-1.md", { 
  method: "PUT",
  body: bodyContent,
  headers: headersList
});

let data = await response.text();
console.log(data);
```

```jsbtoa("Hello world 2!. \n<https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28>")
'SGVsbG8gd29ybGQgMiEuIAo8aHR0cHM6Ly9kb2NzLmdpdGh1Yi5jb20vZW4vcmVzdC9yZXBvcy9jb250ZW50cz9hcGlWZXJzaW9uPTIwMjItMTEtMjg+'
```