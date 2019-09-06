import React from "react"
import Navbar from 'react-bootstrap/Navbar'
import Button from 'react-bootstrap/Button'

export default function NavBar(props){
  

  return(
      <Navbar bg="dark" variant="dark" expand="xl">
        <Navbar.Brand href="#home">Never86's</Navbar.Brand>
     {/*<Nav className="mr-auto">
        <Nav.Link href="#linkToSomeWhere">{props.name}</Nav.Link>
        </Nav> */}
      </Navbar>
  )
}