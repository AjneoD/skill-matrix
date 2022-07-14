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
  background-color: ${(props) => (props.disabled ? "gray" : "#1c92d2")};
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

  const [isDisabled, setIsDisabled] = useState(false);

  console.log(111, "Selected answer: ", answer, answer != "");

  const onSubmit = () => {
   
    storeAnswerLocalStorage(props.data.id, answer);
    setIsDisabled(true);
  };

  const handleInputChange = (e) => {
    if (!isDisabled) {
      setAnswer(e.target.value);
    }
  };

  const storeAnswerLocalStorage = (questionId, questionPoints) => {
    // Get current LS Data & add to end of it
    let current = JSON.parse(localStorage.getItem("points"));
    console.log(111, "Points", current);

    if (current) {
      current.push({ questionId, questionPoints });
      localStorage.setItem("points", JSON.stringify(current));
    } else {
      localStorage.setItem(
        "points",
        JSON.stringify([{ questionId, questionPoints }])
      );
    }
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
            value={answer}
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


     
        <Button
          type="button"
          value="Save"
          onClick={onSubmit}
          disabled={isDisabled}
        />
      </Center>
    </div>
  );
}
