const mongoose = require("mongoose") ;

const memeSchema = mongoose.Schema({
    caption: String,
    filePath: {
        type: String,
        required: true,
    },
    uploadedBy: {
        type: mongoose.Types.ObjectId,
        ref: "User",
        required: true,
    }
}, {timestamps: true}) ;


memeSchema.methods.formatted = async function(req){
    this.populate("uploadedBy") ;
    const populated = JSON.parse(JSON.stringify(await this.execPopulate())) ;
    let paths = this.filePath.split("/") ;
    paths.shift() ;
    return {
        ...populated, 
        filePath: (req.secure ? "https://" : "http://") + req.headers.host + "/" + paths.join("/")
    }
}


const Meme = mongoose.model(
    "Meme", memeSchema
)



module.exports = Meme ;