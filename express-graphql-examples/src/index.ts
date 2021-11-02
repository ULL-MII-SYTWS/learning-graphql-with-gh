import express from 'express';
import { buildSchema } from 'graphql';
import { graphqlHTTP } from 'express-graphql';

import { argv } from 'process';

const port = argv[2] || 5001;

// Construct a schema, using GraphQL schema language
const schema = buildSchema(`
  type Query {
    hello(name: String): String
  }
`);

// The root provides a resolver function for each API endpoint
const rootValue = {
  hello: (args: any) => `Hello ${ args.name || 'world' }!`,
};

const app = express();
app.use(
  '/graphql',
  graphqlHTTP({
    schema,
    rootValue,
    graphiql: { headerEditorEnabled: true },
  }),
);

app.listen(port);
console.log(`Running a GraphQL API server at http://localhost:${port}/graphql`);
