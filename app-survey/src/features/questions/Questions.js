import React from "react";
import Form from "./Form";

export default function Questions({ questions }) {
  return (
    <div>
      <h3 align="center">Questions</h3>
      {questions?.questions &&
        questions.questions.map((item) => <Form data={item} />)}
    </div>
  );
}
