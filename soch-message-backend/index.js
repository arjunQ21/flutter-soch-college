const express = require('express')
const app = express()
const port = 3000
const fs = require("fs")

app.use(express.json())
app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.post("/messages", function(req, res){
    try{
if(req.body.message){
fs.appendFileSync("message.txt" ,req.body.message.trim() + "\n", {encoding: 'utf-8'}) ;
var contents = fs.readFileSync("message.txt", {encoding: "utf-8"}) ;
res.send({status: "success",data: {
    messages: contents ? contents.split("\n").reverse().filter(e => !!e) : []
}})
}else{
    throw new Error("No message found in request") ;
}
    }catch(e){
res.send({
    status: "error",
    data: {
        "message": e.message,
        "stack": e.stack
    }
})
    }
})

app.get("/messages", function(req, res){
    var contents = fs.readFileSync("message.txt", {encoding: "utf-8"}) ;
    res.send({status: "success",data: {
        messages: contents ? contents.split("\n").reverse().filter(e => !!e) : []
    }})
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})