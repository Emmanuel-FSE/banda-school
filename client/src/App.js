import "./App.css";
import SignUpForm from "./Components/SignUpForm";
import Login from "./Components/Login";
import { Route, Routes } from "react-router-dom";
import LandingPage from "./Components/LandingPage";
import { useEffect, useState } from "react";
import Courses from "./Components/Courses";
import Units from "./Components/Units";
import About from "./Components/About";
import Contact from "./Components/Contact";
import ResetPassword from "./Components/ResetPassword";

function App() {
   const [user, setUser] = useState(null);

  useEffect(() => {
    fetch("/me").then((response) => {
      if (response.ok) {
        response.json().then((user) => setUser(user));
      }
    });
  }, []);
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<LandingPage />}></Route>
        <Route path="/sign-up" element={<SignUpForm />}></Route>
        <Route path="/login" element={<Login />}></Route>
        <Route path="/courses" element={<Courses />}></Route>
        <Route path="/courses/units/:id" element={<Units />}></Route>
        <Route path="/about" element={<About />}></Route>
        <Route path="/contact" element={<Contact />}></Route>
        <Route path="/resetpassword" element={<ResetPassword />}></Route>
      </Routes>
    </div>
  );
}

export default App;
