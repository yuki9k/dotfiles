import { fn } from "./sandbox2.ts";

const foo = {
  bar: function (args) {
    console.log("Hello, world!");
  },
};

const args_renamed = 0;
foo.bar(args_renamed);

const baz = foo;

function add() {
  const a = 4;
  const b = 4;
  return a + b;
}

const bool: boolean = fn();
