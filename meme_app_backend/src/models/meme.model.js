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


// memeSchema.methods.formatted = async function


const Meme = mongoose.model(
    "Meme", memeSchema
)



module.exports = Meme ;