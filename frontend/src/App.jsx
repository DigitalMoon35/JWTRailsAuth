import { useState } from 'react'
import reactLogo from './assets/react.svg'
import './App.css'

function App() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const onFormSubmit = () => {
    e.preventDefault()
    const data = {
      username,
      password
    }
    try {
      fetch("http://localhost:3000/users", {
      method: "POST", 
        body: data
      })
        .then(res => res.json())
        .then(data => alert(JSON.stringify(data)));
    } catch (error) {
      console.log(error)
    }

  }
  return (
    <div>
      <form action="" onSubmit={onFormSubmit}>
        <div>
          <label htmlFor="">Username: </label>
          <input type="text" name="" id="" onChange={e => setUsername(e.target.value)} value={username} />
        </div>
        <div>
          <label htmlFor="">Password: </label>
          <input type="password" name="" id="" onChange={e => setPassword(e.target.value)} value={password} />
        </div>
        <button>Submit</button>
      </form>
    </div>
    
  )
}

export default App
