var fs = require("fs");
// fs.readFile("file.txt", "utf8", (err, data) => {
//   if (err) {
//     console.error(err);
//     return;
//   }
//   console.log(data);
// });

const UserData = () => {
  try {
    const data = fs.readFileSync("file.json", "utf8");
    return JSON.parse(data);
  } catch (error) {
    console.error("Error reading input JSON file:", error.message);
    return null;
  }
};

// const data = UserData();
// console.log(data);

const calculateTotalPosts = (userData) => {
  const modifiedData = userData.map((user) => {
    const posts_count = user.posts_count;
    return { ...user, posts_count };
  });

  return modifiedData;
};

const userData = UserData();
const modifiedData = calculateTotalPosts(userData);

const writeUserData = (userData) => {
  try {
    const jsonString = JSON.stringify(userData, null, 2);
    fs.writeFileSync("file.json", jsonString);
    console.log("User data has been updated.");
  } catch (error) {
    console.error("Error writing user data:", error.message);
  }
};

writeUserData(modifiedData);

const addUser = (newUser) => {
  const userData1 = UserData();
  userData1.push(newUser);
  writeUserData(userData1);
};
const newUser = {
  id: 6,
  name: "Sai Ram",
  email: "56darling.sai@gmail.com",
  posts: [
    { id: 101, title: "Cinema", content: "The movie cinema is very intersing" },
  ],
};

addUser(newUser);
