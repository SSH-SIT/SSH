const withImages = require("next-images");

const isProd = process.env.NODE_ENV === "production";

module.exports = withImages({
  env: {
    PUBLIC_API_URL: process.env.PUBLIC_API_URL,
  },
});
