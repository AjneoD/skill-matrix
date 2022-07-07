import { useQuery, gql } from "../../services/hasura-client";
import Page from "../../components/Page";
import { Logout } from "./Logout";
import Questions from "../questions/Questions";

const GET_QUESTIONS_QUERY = gql`
  query {
    questions {
      id
      data
      type
    }
  }
`;

export const App = () => {
  const { isSuccess, data } = useQuery("questions", GET_QUESTIONS_QUERY);
  console.log(111, "PING", isSuccess, data);

  return (
    <Page withPadding title={"Survey App"} actions={<Logout />}>
      {isSuccess && data && <Questions questions={data} />}
    </Page>
  );
};
