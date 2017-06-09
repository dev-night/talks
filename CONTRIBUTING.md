# Contributing

We love contributions from everyone.
By participating in this project,
you agree to abide by our [code of conduct].



We expect everyone to follow the code of conduct in all
of the `/dev/night`s codebases, issue trackers, chatrooms, and mailing lists.

## Contributing a talk

#### General Overview

![workflow](https://raw.github.com/dev-night/talks/master/assets/img/workflow.png "/dev/night talk workflow.")

#### Step 1: Submit a talk suggestion

Submit your talk suggestion as an [issue] in our [talks] project. The __title__ shouldn't be longer than __100 characters__.<br>
Please include the following in the description:
* `Speaker`
    - If you search for a speaker please enter in: `*NEEDED*`
    - If you enter in yourself or someone you know please provide an email address for the [maintainers] to reach you and arrange the talk.
* `Duration` (optional)
    - The talk shouldn't exceed __1h__.
    - Please use `m` for minutes and `h` for hour.
* `Date` (optional)
    - If you want to present it at a specific date. (e.g. `/dev/night #010`, `next time` or `2017-06-13`)
* `Slides/Details` (optional)
    - If you already have slides you can link them here.
    - You can also link some docs or whatever you think gives an overview.
* `Description`
    - Give a short description about the contents of the talk.

##### Essential template

```
* **Speaker**: Niklas Heer (niklas.heer@gmail.com)
* **Description**: Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea tak
```

##### Full template
```
* **Speaker**: Niklas Heer (niklas.heer@gmail.com)
* **Duration**: 45m
* **Date**: 2017-06-13
* **Slides**: http://slides.com/martinjainta/unittests-good-test-bad-test#/
* **Description**: Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea tak
```

#### Step 2: Suggestion goes through the voting system

Everyone can react to a suggestion with an emoji. Most likely thumps up or down. If you have questions you are also welcome to comment.

![reactions](https://raw.github.com/dev-night/talks/master/assets/img/reactions.png "React with emojis.")

#### Step 3: The talk suggestion gets approved

The suggestion has to meet the following criteria to get approved.

1. The talk has to have at least __2__ positive reactions to it. (:thumbsup: :smile: :tada: :hearts:)
2. The talk has to be tagged with the `approved` label from at least one of the [maintainers].

:heavy_exclamation_mark: __Note:__ The numbers can be subject to change.

#### Step 4: Arranging the talk

The [maintainers] will contact you through the email address you provided and arrange the talk with you. You will also be added as a collaborator to the project and the issue for your talk will be assigned to you.

#### Step 5: Providing the slides

You can either __add a comment__ to your initial __issue__ suggesting the talk and add a link to your sildes. Or you can make a [__pull-request__](https://www.digitalocean.com/community/tutorials/how-to-create-a-pull-request-on-github) including the following:

* Add your slides to the event folder inside the `sildes` directory.
* Explain how you can view/open the slides in the `READEME.md` file.
* If there isn't already a folder for the event, please make one as well. These are the conventions:
    - The folder for the event has to reside in the `slides/<year>` folder.
    - The folder name consitst of `<event number>_<event tile>`.

##### Example

```
slides
└── 2017
    └── 010_webweek-special
        └── README.md
```

:heavy_exclamation_mark: __Note:__ By adding your slides you agree to release them under the [_Creative Commons Attribution Share Alike 4.0_](https://creativecommons.org/licenses/by-sa/4.0/) license.


[issue]: https://github.com/dev-night/talks/issues
[code of conduct]: https://tradebyte.github.io/Code-of-Conduct/
[talks]: https://github.com/dev-night/talks
[maintainers]: MAINTAINERS.md
