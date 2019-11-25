const fs = require("fs");

module.exports = function(eleventyConfig) {
  eleventyConfig.setBrowserSyncConfig({
    callbacks: {
      ready: function(err, bs) {
        bs.addMiddleware("*", (req, res) => {
          const content_404 = fs.readFileSync('docs/404.html');
          res.write(content_404);
          res.end();
        });
      }
    }
  });

  return {
    dir: {
      input: "views",
      output: "docs"
    }
  };
};