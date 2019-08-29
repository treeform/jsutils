# JS Utils

* Strings

- Common operations you might want to perform on JS strings. They are much faster to work with then normal nim strings compiled to JS.


* Json

- Serilise and deserilize JSON that is missing fields and handles nils. Which is very commong for JS to have.


* Streams

- Read and write binary file formats in nim using streams that have exact same API as the build int Streams that don't work with JS very well. Some methods are not copied because they would require pointers which JS does not support.