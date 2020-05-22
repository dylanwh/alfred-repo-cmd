 rtrimstr("\n") | split("\n") | {
  items: [
    .[] | {
      title: .,
      subtitle: "open in vscode",
      uid: .,
      arg: "\($ENV.GITHUB_CHECKOUT_DIR)/\(.)",
      autocomplete: .,
      match: ( [., (split("/")[1]), ( split("\\W"; "") | join(" ")  ) ]) | join(" "),
      icon: { path: (split("/")[0] | . + "_github.png") },
    }
  ]
}
