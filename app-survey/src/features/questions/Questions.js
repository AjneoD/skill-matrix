import React, { useState, useEffect } from "react";
import { useQuery, gql } from "../../services/hasura-client";
import Form from "./Form";
import { Box, Button } from "@mui/material";
import styled from "styled-components";
import axios from "axios";

const ADMIN_SECRET = "hasura";

const BASE_URL = "https://8080-ajneod-skillmatrix-hju5nfklxd8.ws-eu53.gitpod.io/v1/graphql"

const GET_QUESTIONS_QUERY = gql`
  query {
    questions {
      id
      type
      data
    }
  }
`;

const ADD_ANSWER_QUERY = gql`
  mutation createAnswer($question_id: Int!, $board_id: Int!, $user_id: Int!, $score: smallint!, $data: json) {

    insert_answers_one(object: {question_id: $question_id, board_id: $board_id,  user_id: $user_id, score: $score, data: $data}, on_conflict: {constraint: answers_pkey, update_columns: score, where: {question_id: {_is_null: false}}}) {
    
    question_id
    board_id
    user_id
    data
    score

  }
}`


export default function Questions({ questions }) {
  const [list, setList] = useState([]);
  const page =
    window.location.pathname.split("/")[
      window.location.pathname.split("/").length - 1
    ];
  const { isSuccess, data } = useQuery("questions", GET_QUESTIONS_QUERY);
  const [end, setEnd] = useState(false);
  const [total, setTotal] = useState(0);

  const addAnswer = () => {
    // thir save button
    axios({
      url: BASE_URL,
      method: "POST",
      headers: {
        "x-hasura-admin-secret": ADMIN_SECRET
      },
      data: {
        variables: {
          question_id: 23,
          board_id: 23,
          user_id: 23,
          data: {
            "option1": "0-Zero",
            "option2": "1-I can read it and orient myself in a file / project",
            "opsion3": "2-I can work on a file / project",
            "option4": "3-I can use it even in more complex projects",
            "option5": "4-I have advanced knowledge, I could teach it to someone else",
            "option6": "5-I know it in all its nuances and I feel calm"
          },
          score: 5
        },
        query: ADD_ANSWER_QUERY
      }
    })
      .then((res) => console.log(res.data))
      .catch((err) => {
        console.log(err);
      });
  };


  useEffect(() => {
    if (data && data.questions && page) {
      setList(
        data.questions.filter(
          (item, pos) =>
            pos >= parseInt(page - 1) * 7 && pos < parseInt(page - 1) * 7 + 7
        )
      );
    }

    if (data && data.questions) {
      if (page * 7 > data.questions.length) {
        setEnd(true);
        calculateTotal();
      }
    }
  }, [data, page]);

  const onSubmit = () => {
    window.location.pathname = `/page/${parseInt(page) + 1}`;
  };

  const onPrevious = () => {
    if (parseInt(page) > 1) {
      window.location.pathname = `/page/${parseInt(page) - 1}`;
      return;
    }

    window.location.pathname = "/";
  };

  const calculateTotal = () => {
    const points = JSON.parse(localStorage.getItem("points"));
    if (points) {
      let totalPoints = 0;

      points.map((i) => {
        totalPoints += parseInt(i.questionPoints);
      });

      setTotal(totalPoints);
    }
  };

  return (
    <Box>
      <h3 align="center">Questions</h3>
      {end && (
        <div>
          <h4 style={{ textAlign: "center" }}>Finished!</h4>
          <h3>You got {total} points!</h3>
        </div>
      )}
      <Box>
        {isSuccess && data && data.questions && list.length > 0
          ? list.map((item) => <Form data={item} />)
          : null}
      </Box>
      <Box
        sx={{
          display: "flex",
          height: "100px",
          flexDirection: "row",
          justifyContent: "space-between",
          borderRadius: 1
        }}
      >
        {isSuccess && !end && <Button onClick={onPrevious}>Previous</Button>}

        {isSuccess && !end && <Button onClick={onSubmit}>Next</Button>}
      </Box>
    </Box>
  );
}
