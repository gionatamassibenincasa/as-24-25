# spammer

To install dependencies:

```bash
bun install
```

To run:

```bash
bun run index.ts
```

## To update mail templates

To create a new mail template:

- modify the subject-${date --iso}.txt file
- modify the template-${date --iso}.html file

## To test

Check the `html` attributes of:

`bun run index.ts`

## To send

`SEND=1 bun run index.ts`

## TODO

Rethink the `certificatePostScriptum` function.

This project was created using `bun init` in bun v1.2.12. [Bun](https://bun.sh) is a fast all-in-one JavaScript runtime.
