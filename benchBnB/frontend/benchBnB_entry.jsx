import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/configureStore";

document.addEventListener("DOMContentLoaded", () => {
  document.getElementById("root");
  const store = configureStore();

  ReactDOM.render(<Root store={store} />, root);
});
