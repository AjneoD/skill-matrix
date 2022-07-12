import React, { useState, useEffect } from "react";
import { useQuery, gql } from "../../services/hasura-client";
import Form from "./Form";
import { Box,Button } from "@mui/material";
import styled from "styled-components";



const GET_QUESTIONS_QUERY = gql`
  query {
    questions {
      id
      type
      data
    }
  }
`;

export default function Questions({ questions }) {
  const [list, setList] = useState([]);
  const page =
    window.location.pathname.split("/")[
      window.location.pathname.split("/").length - 1
    ];
  const { isSuccess, data } = useQuery("questions", GET_QUESTIONS_QUERY);

  useEffect(() => {
    if (data && data.questions && page) {
      setList(
        data.questions.filter(
          (item, pos) =>
            pos >= parseInt(page - 1) * 7 && pos < parseInt(page - 1) * 7 + 7
        )
      );
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

  return (
    <Box>
      <h3 align="center">Questions</h3>
      <Box>
        {isSuccess && data && data.questions && list.length > 0
          ? list.map((item) => <Form data={item} />)
          : null}
      </Box>
      <Box
        sx={{
          display: "flex",
          height:"100px",
          flexDirection: "row",
          justifyContent: "space-between",
          borderRadius: 1,
          

        }}
      >
        {isSuccess && <Button  onClick={onPrevious} >Previous</Button>}
     
        {isSuccess && (
          
          <Button  onClick={onSubmit} >Next</Button>
        )}
      </Box>
        
      
    </Box>
  );
}
