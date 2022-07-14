import { useEffect } from "react";
import Page from "../../components/Page";
import { Logout } from "./Logout";
import Questions from "../questions/Questions";
import { Routes, Route } from "react-router-dom";
import styled from "styled-components";
import Typography from "@mui/material/Typography";
const Start = styled.input`
  position: absolute;
  left: 0;
  right: 0;
  margin: auto;
  background-color: #1c92d2;
  padding: 8px 30px;
  color: white;
  margin-top: 5%;
  border: none;
  border-radius: 15px;
  cursor: pointer;
  width: 22%;
  font-weight: bold;
`;

export const App = () => (
  <Routes>
    <Route path="/" element={<Home />} exact />
    <Route path="/page/:id" element={<Questions />} />
  </Routes>
);

export const Home = () => {
  const onEnter = () => {
    window.location.pathname = "/page/1";
  };

  useEffect(() => {
    localStorage.setItem("points", "[]");
  }, []);

  return (
    <Page withPadding title={"Survey App"} actions={<Logout />}>
      <Typography
        variant="h4"
        component="h2"
        style={{ textAlign: "center", marginTop: "36px" }}
      >
        Welcome to Skill-Matrix!
      </Typography>
      <Typography variant="h6" component="h2" style={{ textAlign: "center" }}>
        A survey used to calculate the knowledge on different Programming
        languages
      </Typography>

      <Start
        id="start"
        type="submit"
        value="Start"
        name="Start"
        onClick={onEnter}
      />
    </Page>
  );
};
