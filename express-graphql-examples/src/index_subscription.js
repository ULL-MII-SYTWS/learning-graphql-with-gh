/*

Does not work. Seems that you have to try with apollo-server instead 

*/
const { createServer } = require('http');

const express =  require('express');
const { execute, subscribe } = require('graphql');
const ws = require('ws');
const { useServer } = require('graphql-ws/lib/use/ws');

const { graphqlHTTP } = require('express-graphql');

const { schema, roots, rootValue } = require('./schema');

const PORT = 5002;
const subscriptionEndpoint = `ws://localhost:${PORT}/subscriptions`;

const app = express();

app.use(
  '/graphql',
  graphqlHTTP({
    schema,
    rootValue,
    graphiql: {
      subscriptionEndpoint,
      websocketClient: 'v1',
    } ,
  }),
);

const server = createServer(app);

const wsServer = new ws.Server({
  server,
  path: '/subscriptions',
});

server.listen(PORT, () => {
  useServer(
    {
      schema,
      roots,
      execute,
      subscribe,
    },
    wsServer,
  );
  console.info(
    `Running a GraphQL API server with subscriptions at http://localhost:${PORT}/graphql`,
  );
});
