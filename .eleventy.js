const fs = require("fs");
const svgContents = require("eleventy-plugin-svg-contents");

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

  eleventyConfig.addPlugin(svgContents);

  eleventyConfig.addCollection("timestamp", () => new Date().getTime());

  eleventyConfig.addFilter('absoluteUrl', (url) => {
    if (url == "/") url = "";
    return `https://msng.link${url}`;
  });

  return {
    dir: {
      input: "src",
      output: "docs",
      data: "_data",
      includes: "_includes"
    }
  };
};