const express = require("express");
const path = require("path");
const cors = require("cors");
const { open } = require("sqlite");
const sqlite3 = require("sqlite3");

const app = express();
app.use(cors());

const dbPath = path.join(__dirname, "blogs.db");

let db = null;

const initializeDBAndServer = async () => {
  try {
    db = await open({
      filename: dbPath,
      driver: sqlite3.Database,
    });
    app.listen(3001, () => {
      console.log("Server is running at port no: 3001");
    });
  } catch (e) {
    process.exit(1);
  }
};

const middleware = (request, response, next) => {
  console.log(request.url);

  const options = {
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "numeric",
    minute: "numeric", // Corrected property name
    second: "numeric",
    hour12: false,
  };

  const formattedDate = new Date().toLocaleString("en-IN", options);
  console.log(formattedDate);

  next();
};

app.get("/log", middleware, (request, response) => {
  response.send("Log");
});

app.get("/posts", middleware, async (request, response) => {
  const getpostsQuery = `
  SELECT posts.*, user.user_name 
  FROM posts
  INNER JOIN user ON posts.user_id = user.user_id;
`;
  const postsArray = await db.all(getpostsQuery);
  response.send(postsArray);
});

initializeDBAndServer();
