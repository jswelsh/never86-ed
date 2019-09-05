import React from "react"

import Container from 'react-bootstrap/Container'
import Form from 'react-bootstrap/Form'
import Button from 'react-bootstrap/Button'

export default function LoginForm(props){

  return(
    <Container>
    <Form onSubmit={console.log("form on click")}>
      <Form.Group controlId="email">
        <Form.Label>Email Address</Form.Label>
        <Form.Control type="email" placeholder="Enter email" />
        <Form.Text className="text-muted"></Form.Text>
      </Form.Group>

      <Form.Group controlId="password">
        <Form.Label>Password</Form.Label>
        <Form.Control type="password" placeholder="Password" />
      </Form.Group>
 {/*  <Form.Group controlId="formBasicChecbox">
        <Form.Check type="checkbox" label="Bar Manager" />
      </Form.Group> */}

      <Button variant="primary" type="submit">Submit</Button>
    </Form>
    </Container>
  )
}