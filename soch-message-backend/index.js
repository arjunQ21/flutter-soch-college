const express = require('express')
const app = express()
const port = 3000
const fs = require("fs")

app.use(express.json())
app.get('/', (req, res) => {
  res.send('Soch College - Messaging App Backend.')
})

app.post("/messages", function(req, res){
    try{
if(req.body.message && req.body.sentBy){
    if(!getPeople(req.body.sentBy)) throw new Error("People not found by id: " + req.body.sentBy) ;
    var contents = fs.readFileSync("messages.json", {encoding: "utf-8"}) ;
    var messages = JSON.parse(contents) ;
// fs.appendFileSync("message.txt" ,req.body.message.trim() + "\n", {encoding: 'utf-8'}) ;
var newMessage = {
    id: messages.length > 0 ? messages[messages.length - 1]['id'] + 1 : 1,
    message: req.body.message,
    sentBy: req.body.sentBy
} ;
messages.push(newMessage)
fs.writeFileSync("messages.json", JSON.stringify(messages), {encoding: 'utf-8'} ) ;
res.send({status: "success",data: {
    message: formatMessage(newMessage)
}})
}else{
    throw new Error("message or sentBy not found in request") ;
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
function formatMessage(messageObj){
    return {...messageObj, sentBy: getPeople(messageObj.sentBy)} ;
}
function getSavedPeoples(){
    return JSON.parse(fs.readFileSync("peoples.json", {encoding: "utf-8"})) ;
}
function getPeople(id){
let found =  getSavedPeoples().filter(e => e.id == id) ;
if(found.length > 0) return found[0]
else return null 
}

function getSavedMessages(){
    return JSON.parse(fs.readFileSync("messages.json", {encoding: "utf-8"})) ;
}



const singleMessageRouter = express.Router() ;

app.use("/messages/:id", function(req, res, next){
    const messages = getSavedMessages() ;
    const hasId = messages.some(function (e, i, a){
        return e['id'].toString() == req.params.id.toString()
    }) ;
    if(!hasId){
        return res.send({
            status: "fail",
            data: {
                error: "No id found: "+ req.params.id
            }
        })
    }else {
        req.messageId = req.params.id ;
        return next()} ;
}, singleMessageRouter)

singleMessageRouter.put("/", function(req, res){
try{
if(!req.body.message) throw new Error("Message not found in request") ;
let messages = getSavedMessages() ;
for(let i = 0 ; i < messages.length; i++){
    if(messages[i]['id'] == req.messageId){
        messages[i]['message'] = req.body.message.trim() ;
        fs.writeFileSync("messages.json", JSON.stringify(messages), {encoding: 'utf-8'}) ;
        return res.send({
            status: "success",
            data: {
                message:  formatMessage(messages[i])
            }
        })
    }
}
return res.send({
    status: "error",
    data: {
        message: "Not found."
    }
})
}catch(e){
    return res.send({
        status: "error",
        data: {
            message: e.toString()
        }
    })
}
})


singleMessageRouter.delete("/", function(req, res){
    const filtered = getSavedMessages().filter(e => e['id'].toString() != req.messageId.toString() )
    console.log(filtered)
    fs.writeFileSync( "messages.json", JSON.stringify(filtered) , {encoding: 'utf-8'}) ;
    return res.send({
        status: "success",
        data: {}
    })
})



app.post("/peoples/new", function(req, res){
    try{
if(req.body.name){
    var contents = fs.readFileSync("peoples.json", {encoding: "utf-8"}) ;
    var peoples = JSON.parse(contents) ;
// fs.appendFileSync("message.txt" ,req.body.message.trim() + "\n", {encoding: 'utf-8'}) ;
var newPerson = {
    id: peoples.length > 0 ? peoples[peoples.length - 1]['id'] + 1 : 1,
    name: req.body.name
} ;
peoples.push(newPerson)
fs.writeFileSync("peoples.json", JSON.stringify(peoples), {encoding: 'utf-8'} ) ;
res.send({status: "success",data: {
    person: newPerson
}})
}else{
    throw new Error("No person found in request") ;
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
    return res.send({
        status: "success",
        data: getSavedMessages().map(e => formatMessage(e))
    })
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})