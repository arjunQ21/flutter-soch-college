const express = require('express');
const catchAsync = require('../utils/catchAsync');
const Meme = require('../models/meme.model');
const auth = require('../middlewares/auth');
const validate = require('../middlewares/validate');
const Joi = require('joi');
const multer = require('multer');
const ApiError = require('../utils/ApiError');
const httpStatus = require('http-status');
const router = express.Router();

const upload = multer({storage: multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'src/uploads/memes/')
    },
    filename: function (req, file, cb) {
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
      cb(null, file.fieldname + '-' + uniqueSuffix + "." + file.mimetype.split("/")[1])
    }
  })})


router.get("/", auth(), catchAsync(async function(req, res){
    return res.send(await Meme.find({})) ;
}))

router.post("/", auth(), upload.single("image"), catchAsync(async function(req, res){

if(!req.file) throw new ApiError( 400, "File not uploaded") ;

if(req.file.mimetype.split("/")[0] != 'image') throw new ApiError( 400, "Only images allowed.") ;

// console.log(req.user)

const meme = await Meme.create({
    caption: req.body.caption,
    filePath: req.file.path,
    uploadedBy: req.user._id,
})

// console.log(req.file)



return res.status(201).send({meme}) ;

}))


module.exports = router;
