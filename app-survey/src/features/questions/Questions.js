import React, {useState} from "react";
import Form from "./Form";
import styled from "styled-components";


const Button = styled.input`
  padding: 8px;
  margin-left: 79%;
  width: 10%;
  background-color: #1c92d2;
  color: white;
  margin-top: 1%;
  border: none;
  border-radius: 15px;
  cursor: pointer;
`;

export default function Questions({ questions }) {
  const [message, setMessage] = useState("");
  const onSubmit = () =>{
    console.log(message);
    
  }
  

  return (
    <div>
      <h3 align="center">Questions</h3>
      {questions?.questions &&
        questions.questions.map((item) => <Form data={item} />)}

      <Button type="Button" value="Submit" onClick={onSubmit} />
    </div>
  );
}
