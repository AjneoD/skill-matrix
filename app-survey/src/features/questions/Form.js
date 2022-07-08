import React, { useState } from "react";
import styled from "styled-components";
import { useQuery, gql } from "../../services/hasura-client";
import { useMutation } from "react-query";

const Center = styled.div`
  text-align:center;
  background: #E0EAFC;
  padding: 10px;
  border-radius: 16px;
  margin-bottom: 16px;
  box-shadow: 5px 10px 18px #888888;
  margin-top:23px;
  width:55%;
  margin-left:25%;
  
`;

const Title = styled.h1`
  font-size: 1em;
  text-align: center;
  color: black;
`;

const Button = styled.input`
  padding: 8px;
  margin-left: 10px;
  width: 10%;
  background-color: #4caf50;
  color: white;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
`;


const POST_ANSWER_MUTATION = gql`
mutation () { 
  insert_answers(objects: [[{board_id:"1", user_id:"1", question_id:"1", score: 10, data: "", notes:"", created_at:"2022-06-21T01:20:44.668549+00:00", updated_at:"2022-06-21T01:20:44.668549+00:00"}]]) {
    returning { 
      id  
    }
  }
}
`;

export default function Form(props) {
  const [answer, setAnswer] = useState("");
  // const [addAnswer] = useMutation(POST_ANSWER_MUTATION);

  const onSubmit = () => {
    console.log({
      ques: props.data?.data?.question,
      ans: answer
    });

    // addAnswer();
  };

  return (
    <Center>
      {console.log("data", props.data)}
      <Title>Q: {props.data?.data?.question}</Title>
      <input
        placeholder="Enter answer.."
        value={answer}
        onChange={(e) => setAnswer(e.target.value)}
      />
      <Button type="button" value="save" onClick={onSubmit} />
    </Center>
  );
}
