const fs = require("fs")
const insp = require("util").inspect;
const express = require("express")
const { graphqlHTTP } = require("express-graphql")
const { buildSchema } = require("graphql")
const port = process.argv[2] || 4006;

const csvFilePath = process.argv[3] || 'DMSI-2122.csv'
const data = String(fs.readFileSync(csvFilePath))

const csv=require('csvtojson')

const AluSchema = buildSchema(`
  """
  A student. Field AluXXX is the ULL Id, the name and 
  then as many fields as labs are in the subject 
  """
  type Student {
      AluXXXX: String!
      Nombre: String!
      markdown: String
  }

  type Query {
      """
      To get all students
      """
      students: [ Student ]
      student(AluXXXX: String!): Student
  }

  type Mutation {
      addStudent(AluXXXX: String!, Nombre: String!): Student

      """
      To modify the mark for the lab "learn Markdown"
      """
      setMarkdown(AluXXXX: String!, markdown: String!): Student
  }
`)

const app = express()

async function main () {
    let classroom=await csv().fromFile(csvFilePath);
    fs.writeFileSync('DMSI-2122.json',JSON.stringify(classroom, false, 2))

    const root = {
        students: () => classroom,
        student: (aluId) => {
            //console.log(aluId)
            let result = classroom.find(s => {
                return s["AluXXXX"] == aluId.AluXXXX
            });
            return result
        },
        addStudent: ({AluXXXX, Nombre}) => { 
            console.log(AluXXXX, Nombre)
            let result = classroom.find(s => {
                // console.log(`Processing ${insp(s, {depth:null})}`);
                return s["AluXXXX"] == AluXXXX
            });
            if (!result) {
                let alu = {AluXXXX : AluXXXX, Nombre: Nombre}
                console.log("Not found! Inserting ")

                classroom.push(alu)
                return alu    
            }
            return result;
        },
        setMarkdown: ({AluXXXX, markdown}) => {
            let result = classroom.findIndex(s => s["AluXXXX"] === AluXXXX)
            if (result === -1) {
              let message = `${AluXXXX} not found!`
              console.log(message);
              return null;
            } 
            classroom[result].markdown = markdown
            return classroom[result]
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


