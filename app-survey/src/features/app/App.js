import { useQuery, gql } from "../../services/hasura-client";
import Page from "../../components/Page";
import { Logout } from "./Logout";
import Questions from "../questions/Questions";

const GET_QUESTIONS_QUERY = gql`
  query {
    questions {
      id,
      type,
      data,
    }
  }
`;

export const App = () => {
  const { isSuccess, data } = useQuery("questions", GET_QUESTIONS_QUERY);
  console.log(111, "PING",  data);

  return (
    <Page withPadding title={"Survey App"} actions={<Logout />}>
      {isSuccess && data && <Questions questions={data} />}
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