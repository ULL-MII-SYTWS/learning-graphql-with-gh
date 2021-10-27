const fs = require("fs")
const insp = require("util").inspect;
const express = require("express")
const { graphqlHTTP } = require("express-graphql")
const { buildSchema } = require("graphql")
const port = process.argv[2] || 4006;

const csvFilePath = process.argv[3] || 'DMSI-2122.csv'
const data = String(fs.readFileSync(csvFilePath))
//console.log(data);

const csv=require('csvtojson')
const SchemaStr = String(fs.readFileSync('aluschema.gql', {encoding: "utf8"}))
//console.log(SchemaStr)
debugger;
const AluSchema = buildSchema(SchemaStr)

const app = express()

async function main () {
    let classroom=await csv().fromFile(csvFilePath);
    // console.log(typeof classroom);
    fs.writeFileSync('DMSI-2122.json',JSON.stringify(classroom, false, 2))

    const root = {
        students: () => classroom,
        student: ({AluXXXX}) => {
            let result = classroom.find(s => {
                return s["AluXXXX"] == AluXXXX
            });
            return result
        },
        addStudent: (obj, args, context, info) => {
            const {AluXXXX, Nombre} = obj; 

            let result = classroom.find(s => {
                // console.log(`Processing ${insp(s, {depth:null})}`);
                return s["AluXXXX"] == AluXXXX
            });
            if (!result) {
                let alu = {AluXXXX : AluXXXX, Nombre: Nombre}
                console.log(`Not found ${Nombre}! Inserting ${AluXXXX}`)

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


