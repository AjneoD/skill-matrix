import Page from "../../components/Page";
import { Logout } from "./Logout";
import Questions from "../questions/Questions";
import { Routes, Route } from "react-router-dom";
import styled from "styled-components";

const Start = styled.input`
  position: absolute;
  left: 0;
  right: 0;
  margin: auto;
  background-color: #1c92d2;
  padding: 8px 30px;
  color: white;
  margin-top: 14%;
  border: none;
  border-radius: 15px;
  cursor: pointer;
  width:22%;
  font-weight:bold;
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

  return (
    <Page withPadding title={"Survey App"} actions={<Logout />}>
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

/* 


const query = gql`
query MyQuery1 {
    answers(where: {user_id: {_eq: 1}}) {
      NOTES
      SCORE
      board_id
      created_at
      question_id
      updated_at
      user_id
    }
  }
`;

export const App = () => {
  const { isSuccess,  data } = useQuery("MyQuery", PING_ACTION_QUERY);
  // const test1 = useQuery("MyQuery1", query);
  console.log(data);
  // console.log("my data",test1.data);

  return (
    <>
    <Routes>
      <Route path="/" element={<Page withPadding title={"Survey App"} actions={<Logout />}> 
        {isSuccess
          ? `Computer says: ${data.questions[0].data.text}`
          : "loading time..."}
      </Page>}/>
      <Route path="/survey" element={<Survey item={data} />} />
      
    </Routes>
    </>

  );
};
*/
