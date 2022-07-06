import { useQuery, gql } from "../../services/hasura-client";
import Page from "../../components/Page";
import { Logout } from "./Logout";

const PING_ACTION_QUERY = gql`
  query {
    users{
      id
      name
    }
    
    surveys {
      id
    }
    
    boards{
      id
      name
    }

    boards_admins{
      board_id
      user_id
    }

    questions {
      id
      data
    }

    answers{
      id
      board_id
    }
  }
`;

export const App = () => {
  const { isSuccess, data } = useQuery("PingAction", PING_ACTION_QUERY);
  console.log(111, "PING", isSuccess, data);

  return (
    <Page withPadding title={"Survey App"} actions={<Logout />}>
      {isSuccess ? `Computer says:` : "loading time..."}
    </Page>
  );
};
