import React from "react"
import Navbar from 'react-bootstrap/Navbar'
import Jumbotron from 'react-bootstrap/Jumbotron'

export default function NavBar(props){
  

  return(
    <Jumbotron fluid>
      <Navbar bg="dark" variant="dark" expand="xl">
        <Navbar.Brand href="#home">Never86's -- currently in session_newjsx, move to nav later</Navbar.Brand>
     {/*<Nav className="mr-auto">
        <Nav.Link href="#linkToSomeWhere">{props.name}</Nav.Link>
        </Nav> */}
      </Navbar>
    </Jumbotron>
  )
}