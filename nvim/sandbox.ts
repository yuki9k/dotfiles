const foo = {
  bar: function (args) {
    console.log("Hello, world!");
  },
};

const args_renamed = 0;
foo.bar(args_renamed);

const baz = foo;

function t() {
  const a = 4;
  const b = 4;
  return a + b;
}
