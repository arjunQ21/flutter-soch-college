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
    var contents = fs.readFileSync("messages.json", {encoding: "utf-8"}) ;
    var messages = JSON.parse(contents) ;
// fs.appendFileSync("message.txt" ,req.body.message.trim() + "\n", {encoding: 'utf-8'}) ;
var newMessage = {
    id: messages.length > 0 ? messages[messages.length - 1]['id'] + 1 : 1,
    message: req.body.message
} ;
messages.push(newMessage)
fs.writeFileSync("messages.json", JSON.stringify(messages), {encoding: 'utf-8'} ) ;
res.send({status: "success",data: {
    message: newMessage
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
                message: messages[i]
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


app.get("/messages", function(req, res){
    return res.send({
        status: "success",
        data: getSavedMessages()
    })
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})