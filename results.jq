{ 
    items: [ 
        .[] | {
            title: .,
            uid: .,
            arg: .,
            match: ( split("/") | join(" ") ),
            icon: { path: (split("/")[0] | . + ".png") },
        }
    ]
}
