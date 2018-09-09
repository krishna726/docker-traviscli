# Another docker-traviscli

[![](https://travis-ci.org/wenlock/docker-traviscli.svg?branch=master)](https://travis-ci.org/wenlock/docker-traviscli)

Lets build another travis cli tool for docker so we can hack. :tada:

## Using the image
Here is some instructions on how to use it.

### Use it

For example:

```
eval $(docker run --rm travis:1.1 init)
travis help
```

## Local Development

### Build it
`make build`

### Test it
```
eval $(docker run --rm travis:1.1 init)
travis test
```

### Shell
Start a shell with
```
eval $(docker run --rm travis:1.1 init)
travis shell
```

## Contributing to docker-traviscli

Want to help me, wow cool!  

Fork this repo and submit a PR :D

## Licensing
[MIT](LICENSE.txt)
