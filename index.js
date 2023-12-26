import express from "express";

const app = express();
app.get("/", (req, res) => {
  res.send("Hello World from app 1");
});

const port = process.env.PORT || 3000;

console.log({ port });

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
