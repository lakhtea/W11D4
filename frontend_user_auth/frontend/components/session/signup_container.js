import { connect } from "react-redux";
import { createNewUser } from "../../actions/session";
import Signup from "./signup";

const mapDTP = (dispatch) => {
  return {
    createNewUser: (formUser) => dispatch(createNewUser(formUser)),
  };
};

export default connect(null, mapDTP)(Signup);
