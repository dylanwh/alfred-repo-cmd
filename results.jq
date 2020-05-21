{
    items: [
        .[] | {
            title: .,
            uid: .,
            arg: .,
            autocomplete: .,
            match: ( [ [.], split("\\W"; "") | join(" ") ] | join(" ") ),
            icon: { path: (split("/")[0] | . + ".png") },
        }
    ]
}
