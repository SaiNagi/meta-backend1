const axios = require("axios");

// Set URL as a constant
const URL = "https://apis.ccbp.in/blogs";

axios
  .get(URL)
  .then((response) => {
    // Print only the data from the response
    console.log(response.data);
  })
  .catch((error) => {
    console.error("Error fetching data:", error);
  });
