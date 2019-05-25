import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          <p> API_URL: { window._env_.API_URL }</p>
          <p> API_NAME: { window._env_.API_NAME }</p>
        </a>
      </header>
    </div>
  );
}

export default App;
