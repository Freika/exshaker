import "phoenix_html"

import socket from "./socket"
import $ from "jquery"
import "./nicks"

class App {
  static init() {
    console.log("Initialized Test")
  }
}

$( () => App.init() )

export default App
