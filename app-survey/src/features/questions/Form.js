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
  text-align:center;
  background: #F2F2F2;
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
  background-color: #1c92d2;
  color: white;
  margin-top: 34%;
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
     
        
        <FormControl>
        <FormLabel id="demo-radio-buttons-group-label"></FormLabel>
        <RadioGroup
          aria-labelledby="demo-radio-buttons-group-label"
          defaultValue="female"
          name="radio-buttons-group"
        >
          <FormControlLabel value="0" control={<Radio />} label="0 = Zero" />
          <FormControlLabel value="1" control={<Radio />} label="1 = I can read it and orient myself in a file / project" />
          <FormControlLabel value="2" control={<Radio />} label="2 = I can work on a file / project" />
          <FormControlLabel value="3" control={<Radio />} label="3 = I can use it even in more complex projects" />
          <FormControlLabel value="4" control={<Radio />} label="4 = I have advanced knowledge, I could teach it to someone else" />
          <FormControlLabel value="5" control={<Radio />} label="5 = I know it in all its nuances and I feel calm" />
        </RadioGroup>
    
       
        {/* value={answer}
        onChange={(e) => setAnswer(e.target.value)} */}
        </FormControl>
      
       


      <Button type="button" value="save" onClick={onSubmit} />
    
    </Center>

    
  );
}
