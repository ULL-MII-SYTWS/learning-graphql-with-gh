const util = require("util")
const ins = (e, d=2) => util.inspect(e, {depth: d})

const { ApolloServer, gql } = require("apollo-server")

const { 
    ApolloServerPluginLandingPageProductionDefault,
    ApolloServerPluginLandingPageLocalDefault,
  } = require('apollo-server-core');

const typeDefs = gql`

  type Query {
      hello(name: String): String!
  }

  type User {
      id: ID!
      name: String!
  }

  type Error {
      field: String!
      message: String!
  }

  type RegisterResponse {
      user: User!
      errors: [ Error ]
  }

  input UserInfo {
    id: String!
    password: String!
    age: Int
  }

  type Mutation {
      register(userInfo: UserInfo!): RegisterResponse
      login(userInfo: UserInfo!): String!
  }
`

const resolvers = {
    Query: {
        hello: (parent, {name}) => {
            console.log(name)
            return `hello ${name || "world"}!`
        }
    },
    Mutation: {
        login: (parent, args, context, info) => {
            console.log("======== parent ========")
            console.log(ins(parent));
            
            console.log("======== args ========")
            console.log(ins(args, null));
            
            console.log("======== context ========")
            console.log(ins(context, 1));
            
          
            console.log("======== info ========")
            console.log(ins(info));
              
            return args.userInfo.id;
        },
        register: () => ({
            user: {id: 1, name: "Juan"},
            errors: [{ field: "a", message: "Buf!"}]
            
        })
    }
}

const Server = new ApolloServer({
    typeDefs, 
    resolvers,
    plugins: [
    process.env.NODE_ENV === 'production' ?
      ApolloServerPluginLandingPageProductionDefault({ footer: false }) :
      ApolloServerPluginLandingPageLocalDefault({ footer: false })
    ]
})

Server.listen().then(({url}) => console.log(`Server listening at ${url}`))