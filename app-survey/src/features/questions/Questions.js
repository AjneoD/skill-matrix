import React from "react";
import Form from "./Form";

export default function Questions({ questions }) {
  return (
    <div>
      <h3>Questions</h3>
      {questions?.questions &&
        questions.questions.map((item) => <Form {...item} />)}
    </div>
  );
}
