 rtrimstr("\n") | split("\n") | {
  items: [
    .[] | {
      title: .,
      subtitle: "View on GitHub",
      uid: .,
      arg: "https://github.com/\(.)",
      autocomplete: .,
      match: ( [., (split("/")[1]), ( split("\\W"; "") | join(" ")  ) ]) | join(" "),
      icon: { path: (split("/")[0] | . + "_github.png") },
      quicklookurl: "https://github.com/\(.)",
      text: { copy: . },
      mods: {
        alt: {
          valid: true,
          arg: "https://github.com/\(.)/wiki",
          subtitle: "View Wiki",
        },
        cmd: {
          valid: true,
          arg: "https://github.com/\(.)/pulls",
          subtitle: "View Pull Requests",
        }
      },
    }
  ]
}
