# Web Stack Debugging

In this project, We tried debugging why "curl -sI 127.0.0.1" returns 500 server error.
When debugging, sometimes logs are not enough. Either because the software is breaking in a way that was not expected and the error is not being logged, or because logs are not providing enough information. In this case, we use `strace` to debug reasons.
some of the commands tried were:

`strace -p <pid> 2>&1 | grep -P -- "-1"`
`strace -e trace=open -p <pid>`
`strace -o rashisky.txt curl -sI 127.0.0.1`
