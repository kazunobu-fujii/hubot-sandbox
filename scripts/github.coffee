module.exports = (robot) ->
  github = require('githubot')(robot)

  github.handleErrors (response) ->
    console.log "Oh no! #{response.statusCode}!"

  robot.respond /create pull request/i, (msg) ->
    data = {"title": "new feature", "head": "feature/add-comment", "base": "develop"}
    github.post "/repos/kazunobu-fujii/git-sandbox/pulls", data, (pr) ->
      msg.send "check #{pr.url}"

