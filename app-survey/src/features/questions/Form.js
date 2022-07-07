import React, { useState } from "react";
import styled from "styled-components";
import { useQuery, gql } from "../../services/hasura-client";
import { useMutation } from "react-query";

const Center = styled.div`
  text-align: center;
  background: cyan;
  padding: 10px;
  border-radius: 16px;jj
  margin-bottom: 16px;
`;

const Title = styled.h1`
  font-size: 1em;
  text-align: center;
  color: palevioletred;
`;

const Button = styled.input`
  background: green;
  padding: 10px;
  color: white;
  border-radius: 8px;
  margin-left: 10px;
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
  const [addAnswer] = useMutation(POST_ANSWER_MUTATION);



  const onSubmit = () => {
    addAnswer();
  };

  return (
    <Center>
      <Title>Q: (should be here ..)</Title>
      <input
        placeholder="Enter answer.."
        value={answer}
        onChange={(e) => setAnswer(e.target.value)}
      />
      <Button type="button" value="submit" onClick={onSubmit} />
    </Center>
  );
}
