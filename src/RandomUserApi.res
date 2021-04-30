type name = {first: string, last: string, title: string}

type picture = {large: string, medium: string, thumbnail: string}

type user = {name: name, picture: picture}

type result = {results: array<user>}

// bind to JS' JSON.parse
@scope("JSON") @val
external parseIntoResult: string => result = "parse"

let loadData = () =>
  Fetch.fetch("https://randomuser.me/api/?results=50")
  ->Js.Promise.then_(response => response->Fetch.Response.text, _)
  ->Js.Promise.then_(body => body->parseIntoResult->Js.Promise.resolve, _)
