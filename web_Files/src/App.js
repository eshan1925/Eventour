import React from "react";
import About from "./About";
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import "./App.css";
import AboutProject from "./AboutProject";

function App() {

 
  return (
    <Router>
      <Switch>
        <Route exact path ="/us"><About /></Route>
        <Route exact path ="/"><AboutProject /></Route>
      </Switch>
    </Router>
  
  );
}

export default App;
