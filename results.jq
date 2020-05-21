{
    items: [
        .[] | {
            title: .,
            uid: .,
            arg: .,
            autocomplete: .,
            match: ( [ [.], split("/") | join(" ") ] | join(" ") ),
            icon: { path: (split("/")[0] | . + ".png") },
        }
    ]
}
