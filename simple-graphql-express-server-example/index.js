const fs = require("fs")
const insp = require("util").inspect;
const express = require("express")
const { graphqlHTTP } = require("express-graphql")
const { buildSchema } = require("graphql")
const port = process.argv[2] || 4006;

const data = String(fs.readFileSync(process.argv[3] || 'DMSI-2122.csv'))

const AluSchema = buildSchema(`
  type Student {
      AluXXXX: String!
      Nombre: String!
      markdown: String!
  }

  type Query {
      students: [ Student ]
      student(AluXXXX: String!): Student
  }

  type Mutation {
      addStudent(AluXXXX: String!, Nombre: String!): Student
  }
`)


const app = express()
const csvFilePath='DMSI-2122.csv'
const csv=require('csvtojson')

async function main () {
    let classroom=await csv().fromFile(csvFilePath);
    fs.writeFileSync('DMSI-2122.json',JSON.stringify(classroom, false, 2))

    const root = {
        students: () => classroom,
        student: (aluId) => {
            //console.log(aluId)
            let result = classroom.find(s => {
                // console.log(`Processing ${insp(s, {depth:null})}`);
                return s["AluXXXX"] == aluId.AluXXXX
            });
            // console.log(result)
            return result
        }
    }
      
    app.use(
        '/graphql',
        graphqlHTTP({
          schema: AluSchema,
          rootValue: root,
          graphiql: true,
        }),
      );
      
      app.listen(port);
      console.log("Running at port "+port)
}

main();


