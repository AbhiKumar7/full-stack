import express from 'express'
  

export const app = express()






app.get("/api/po",(request,response) =>{
      response.send("hello")
})