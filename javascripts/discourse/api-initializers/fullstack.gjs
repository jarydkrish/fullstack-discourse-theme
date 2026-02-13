import { apiInitializer } from "discourse/lib/api";
import ExperimentalScreen from "../components/experimental-screen";

export default apiInitializer((api) => {
  api.renderInOutlet("above-main-container", ExperimentalScreen);
});
