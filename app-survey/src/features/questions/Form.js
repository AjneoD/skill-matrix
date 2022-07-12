import React, { useState } from "react";
import styled from "styled-components";
import { useQuery, gql } from "../../services/hasura-client";
import { useMutation } from "react-query";
import {
  FormControl,
  FormLabel,
  RadioGroup,
  FormControlLabel,
  Radio
} from "@mui/material";


const Center = styled.div`
  text-align: center;
  background: #f2f2f2;
  padding: 10px;
  border-radius: 16px;
  margin-bottom: 59px;
  box-shadow: 8px 10px 20px #888888;
  margin-top: 23px;
  width: 110%;
  margin-left: -6%;
`;

const Title = styled.h1`
  font-size: 1em;
  text-align: center;
  color: black;
`;

const Button = styled.input`
  padding: 8px;
  margin-left: 76%;
  width: 13%;
  background-color: #1c92d2;
  color: white;
  margin-top: 1%;
  border: none;
  border-radius: 15px;
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

  console.log(111, "Selected answer: ", answer);

  const onSubmit = () => {
    // addAnswer();
  };

  const handleInputChange = (e) => {
    setAnswer(e.target.value);
  };

  return (
    <div>
      <Center>
        {console.log("data", props.data)}
        <Title>Q: {props.data?.data?.question}</Title>

        <FormControl>
          <FormLabel id="demo-radio-buttons-group-label"></FormLabel>
          <RadioGroup
            aria-labelledby="demo-radio-buttons-group-label"
            name="radio-buttons-group"
            onChange={handleInputChange}
          >
            <FormControlLabel value="0" control={<Radio />} label="0 = Zero" />
            <FormControlLabel
              value="1"
              control={<Radio />}
              label="1 = I can read it and orient myself in a file / project"
            />
            <FormControlLabel
              value="2"
              control={<Radio />}
              label="2 = I can work on a file / project"
            />
            <FormControlLabel
              value="3"
              control={<Radio />}
              label="3 = I can use it even in more complex projects"
            />
            <FormControlLabel
              value="4"
              control={<Radio />}
              label="4 = I have advanced knowledge, I could teach it to someone else"
            />
            <FormControlLabel
              value="5"
              control={<Radio />}
              label="5 = I know it in all its nuances and I feel calm"
            />
          </RadioGroup>
        </FormControl>

        <Button type="button" value="Save" onClick={onSubmit} />
      </Center>
    </div>
  );
}
