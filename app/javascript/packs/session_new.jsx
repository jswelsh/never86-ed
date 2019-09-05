import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import Navbar from 'react-bootstrap/Navbar'
import Container from 'react-bootstrap/Container'
/* import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col' */

import Form from 'react-bootstrap/Form'
import Button from 'react-bootstrap/Button'


const Session_new = props => (
  <div>
      {/* change to navbar in bootstrap */}
    <Navbar bg="dark" variant="dark" expand="xl">
      <Navbar.Brand href="#home">Never86's</Navbar.Brand>
{/*         <Nav className="mr-auto">
      <Nav.Link href="#linkToSomeWhere">{props.name}</Nav.Link>
        </Nav> */}
    </Navbar>

    <Container>
      <Form>
        <Form.Group controlId="formBasicEmail">
          <Form.Label>Email Address</Form.Label>
          <Form.Control type="email" placeholder="Enter email" />
          <Form.Text className="text-muted"></Form.Text>
        </Form.Group>

        <Form.Group controlId="formBasicPassword">
          <Form.Label>Password</Form.Label>
          <Form.Control type="password" placeholder="Password" />
        </Form.Group>
        <Form.Group controlId="formBasicChecbox">
          <Form.Check type="checkbox" label="Check me out" />
        </Form.Group>

        <Button variant="primary" type="submit">Submit</Button>
      </Form>
      </Container>
  </div>
)

/* Session_new.defaultProps = {
  name: 'David'
} */

/* Session_new.propTypes = {
  name: PropTypes.string
} */



document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Session_new name="Login" />,
    document.body.appendChild(document.createElement('div')),
  )
})
